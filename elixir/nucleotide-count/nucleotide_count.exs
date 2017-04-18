defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    _count(strand, nucleotide)
  end

  def _count(strand, nucleotide, counter \\ 0)
  def _count([head|tail], nucleotide, counter) do
    cond do
      head == nucleotide -> _count(tail, nucleotide, counter + 1)
      true -> _count(tail, nucleotide, counter)
    end
  end
  def _count([], nucleotide, counter) do
    counter
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    _histogram(strand)
  end

  def _histogram(strand, hist \\ %{?A=> 0, ?C=> 0, ?G=> 0, ?T=> 0})
  def _histogram([head|tail], hist) do
    next = Map.put(hist, head, hist[head] + 1)
    _histogram(tail, next)
  end
  def _histogram([], hist) do
    hist
  end
end