defmodule GenomixerTest do
  use ExUnit.Case
  import Genomixer

  test "the truth" do
    assert 1 + 1 == 2
  end
end

defmodule GenomixerDnaTest do
  use ExUnit.Case
  import Genomixer.Dna

  test "to_codons turns dna seq into list of trigrams" do
    seq1 = "abcdefghijklmnop"
    to_codons(seq1) == ["abc","def","ghi","jkl","mno","p"]
  end

  test "codon_to_amino_acid " do
    assert codon_to_amino_acid("ttt") == "Phe"
  end
end
