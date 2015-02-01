defmodule Genomixer.Assembler do

  def prep_fragment(fragment) when fragment |> is_binary do
    fragment |> String.to_char_list
  end

  def match_end(_frag1, [], acc), do: acc
  def match_end([], _frag2, acc), do: acc
  def match_end([head1|_tail1], [head2|_tail2], acc) when head1 != head2 do
    acc
  end
  def match_end([head1|tail1], [head2|tail2], acc) when head1 == head2 do
    match_end(tail1, tail2, acc+1)
  end

end
