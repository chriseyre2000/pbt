defmodule PropThinking do
  use ExUnit.Case
  use PropCheck

  property "biggest" do
    forall list <- integer() |> list() |> non_empty() do
      Thinking.biggest(list) == model_biggest(list)
    end
  end

  defp model_biggest(list) do
    list |> Enum.sort |> List.last
  end
end