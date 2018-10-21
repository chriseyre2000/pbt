defmodule PropThinking do
  use ExUnit.Case
  use PropCheck

  property "biggest" do
    forall list <- integer() |> list() |> non_empty() do
      Thinking.biggest(list) === model_biggest(list)
    end
  end

  defp model_biggest(list) do
    list |> Enum.sort |> List.last
  end

  property "last number" do
    forall {list, known_last} <- {number() |> list(), number() }
    do
      known_list = list ++ [known_last]
      known_last == List.last(known_list)
    end
  end

  property "sorting" do
    forall list <- term() |> list()  do
      is_ordered(Enum.sort(list))
    end
  end  

  defp is_ordered([a,b| t]) do
    a <= b and is_ordered([b | t])
  end

  defp is_ordered(_) do
    true
  end

  property "same size" do
    forall l <- number() |> list() do
      length(l) === length( Enum.sort(l) )
    end
  end

  property "no element added" do
    forall l <- number() |> list() do
      sorted = Enum.sort(l)
      Enum.all?(sorted, fn element -> element in l end)
    end
  end

  property "no element deleted" do
    forall l <- number() |> list() do
      sorted = Enum.sort(l)
      Enum.all?(l, fn element -> element in sorted end)
    end
  end

  property "symmetric" do
    forall data <- list({atom(), any()}) do
      encoded = encode(data)
      assert is_binary(encoded)
      data === decode( encoded )
    end
  end

  defp encode(a), do: :erlang.term_to_binary(a)
  defp decode(a), do: :erlang.binary_to_term(a)


end