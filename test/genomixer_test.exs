defmodule GenomixerTest do
  use ExUnit.Case
  # import Genomixer.Dna

  test "the truth" do
    assert 1 + 1 == 2
  end
end

defmodule GenomixerDnaTest do
  use ExUnit.Case

  test "to_codons turns dna seq into list of trigrams" do
    seq1 = "abcdefghijklmnop"
    assert Genomixer.Dna.to_codons(seq1) == ["abc","def","ghi","jkl","mno","p"]
  end

end
