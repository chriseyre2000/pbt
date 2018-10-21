defmodule BiggestTest do
  use ExUnit.Case
  use PropCheck 

  property "check biggest works" do
    forall list <- integer() |> list() |> non_empty() do
      #State an invariant
      biggest(list) === list |> Enum.sort |> List.last  
    end
  end

  #Method to be tested
  defp biggest([h|_t]), do: h


end