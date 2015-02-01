defmodule Genomixer.Dna do

  @to_amino_acid %{
    "ttt" => "Phe", 
    "ttc" => "Phe", 
    "tta" => "Leu", 
    "ttg" => "Leu", 
    "tct" => "Ser", 
    "tcc" => "Ser", 
    "tca" => "Ser", 
    "tcg" => "Ser", 
    "tat" => "Tyr", 
    "tac" => "Tyr", 
    "tgt" => "Cys", 
    "tgc" => "Cys", 
    "tgg" => "Trp", 
    "ctt" => "Leu", 
    "ctc" => "Leu", 
    "cta" => "Leu", 
    "ctg" => "Leu", 
    "cct" => "Pro", 
    "ccc" => "Pro", 
    "cca" => "Pro", 
    "ccg" => "Pro", 
    "cat" => "His", 
    "cac" => "His", 
    "caa" => "Gln", 
    "cag" => "Gln", 
    "cgt" => "Arg", 
    "cgc" => "Arg", 
    "cga" => "Arg", 
    "cgg" => "Arg", 
    "att" => "Ile", 
    "atc" => "Ile", 
    "ata" => "Ile", 
    "atg" => "Met", 
    "act" => "Thr", 
    "acc" => "Thr", 
    "aca" => "Thr", 
    "acg" => "Thr", 
    "aat" => "Asn", 
    "aac" => "Asn", 
    "aaa" => "Lys", 
    "aag" => "Lys", 
    "agt" => "Ser", 
    "agc" => "Ser", 
    "aga" => "Arg", 
    "agg" => "Arg", 
    "gtt" => "Val", 
    "gtc" => "Val", 
    "gta" => "Val", 
    "gtg" => "Val", 
    "gct" => "Ala", 
    "gcc" => "Ala", 
    "gca" => "Ala", 
    "gcg" => "Ala", 
    "gat" => "Asp", 
    "gac" => "Asp", 
    "gaa" => "Glu", 
    "gag" => "Glu", 
    "ggt" => "Gly", 
    "ggc" => "Gly", 
    "gga" => "Gly", 
    "ggg" => "Gly", 
    "taa" => "Stop", 
    "tag" => "Stop", 
    "tga" => "Stop"}


  def to_codons(seq) do
    to_codons(seq, [])
  end
  defp to_codons(seq, acc) when byte_size(seq) > 2 do
    to_codons(String.slice(seq, 3..-1), [String.slice(seq, 0..2)] ++ acc)
  end
  defp to_codons(seq, acc) when byte_size(seq) <= 2 do
    Enum.reverse([seq] ++ acc)
  end

  def codon_to_amino_acid(codon) do
    Map.get(@to_amino_acid, codon)
  end

  def to_protein(seq) do
    seq 
    |> to_codons
    |> Enum.map(fn codon -> codon |> codon_to_amino_acid end)
    |> Enum.join
  end


















end
