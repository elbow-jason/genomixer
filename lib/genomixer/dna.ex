defmodule Genomixer.Dna do

  def to_codons(seq) do
    to_codons(seq, [])
  end

  defp to_codons(seq, acc) when byte_size(seq) > 2 do
    to_codons(String.slice(seq, 3..-1), [String.slice(seq, 0..2)] ++ acc)
  end

  defp to_codons(seq, acc) when byte_size(seq) <= 2 do
    Enum.reverse([seq] ++ acc)
  end

end
