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

  test "dna seq to protein" do
    assert "tttcccggg" |> to_protein == "PheProGly"
    assert "atgcatccctttaat" |> to_protein == "MetHisProPheAsn"
    assert "tctgtctga" |> to_protein == "SerValStop"
  end

  test "reverse sequence" do
    assert "abcdef" |> reverse == "fedcba"
  end
end


defmodule GenomixerAssemblerTest do
  use ExUnit.Case
  import Genomixer.Assembler

  test "prep fragment turns to to_char_list" do
    seq1 = "abcdefghijklmnop"
    prep_fragment(seq1) == 'abcdefghijklmnop'
  end

  test "match returns acc (0) with empty frag1" do
    assert match_end([], 'abc', 0) == 0
  end

  test "match returns acc (0) with empty frag2" do
    assert match_end('abc', [], 0) == 0
  end

  test "match returns acc (0) with total mismatch" do
    assert match_end('abc', 'def', 0) == 0
  end

  test "match returns correct number of matching chars" do
    assert match_end('abconetwothree', 'abcdef', 0) == 3
  end

end

defmodule GenomixerBwaTest do
  use ExUnit.Case
  import Genomixer.Bwa


  test "rotate rotates a string" do
    assert rotate("banana$") == "$banana"
  end
end
