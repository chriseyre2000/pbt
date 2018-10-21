defmodule Thinking do

  def biggest([h|t]) do
    biggest(t, h)
  end

  defp biggest([], maxima) do
    maxima
  end

  defp biggest([h|t], maxima) when h >= maxima do
    biggest(t, h)
  end

  defp biggest([_h|t], maxima) do
    biggest(t, maxima)
  end
  
end