defmodule Genomixer.NeedlmanWunsch do

  def align(seq1, seq2) do
    do_align(seq1, seq2)
  end

  defp do_align(seq1, seq2) do
    IO.puts "seq1: #{inspect seq1}"
    IO.puts "seq2: #{inspect seq2}"
  end

end
