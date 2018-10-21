defmodule BiggestTest do
  use ExUnit.Case
  use PropCheck 

  property "check biggest works" do
    # I am experimenting with the Elixir unrolled version of the functions.
    forall list <- integer() |> list() |> non_empty() do
      #State an invariant
      biggest(list) === list |> Enum.sort |> List.last  
    end
  end

  #Method to be tested
  defp biggest([h|t]) do
     biggest(t, h)
  end

  defp biggest([], maxima) do
    maxima
  end

  defp biggest([h|t], maxima) when h >= maxima do
    biggest(t, h)
  end
  
  defp biggest([h|t], maxima) when h < maxima do
    biggest(t, maxima)
  end


end