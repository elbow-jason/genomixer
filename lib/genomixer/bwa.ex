defmodule Genomixer.Bwa do
  @eos "$"

  def transform(frag) when frag |> is_binary do
    make_rotation([frag <> @eos])
  end

  def make_rotation([head|tail]) do
    rotated = rotate(head)
    if Enum.member?(tail, rotated) do
      tail
    else
      make_rotation([rotated] ++ [head] ++ tail)
    end
  end

  def rotate(frag) do
    String.last(frag) <>String.slice(frag, 0..-2)
  end


end
