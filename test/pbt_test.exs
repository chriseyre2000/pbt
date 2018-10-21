defmodule PbtTest do
  use ExUnit.Case
  use PropCheck

  #Property
  property "always works" do
    forall type <- my_type() do
      boolean(type)
    end
  end
  
  #Helpers
  defp boolean(_) do
    true
  end
  
  #Generators
  defp my_type() do
    term()
  end  



end
