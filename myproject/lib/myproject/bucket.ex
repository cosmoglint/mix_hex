defmodule MyProject.Bucket do
  use Agent

  @doc """
    starts a new bucket
  """
  def start_link(_options)do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
    gets the value of a particular key
  """
  def get(bucket, key) do
    Agent.get(bucket, (fn dict -> Map.get(dict, key) end))
  end

  @doc """
    puts a new key with the particular value
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end


  @doc """
  Deletes Key from bucket
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end

end
