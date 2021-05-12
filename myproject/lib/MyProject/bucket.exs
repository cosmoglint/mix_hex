defmodule MyProject.Bucket do
  use Agent
  def start_link(_options)do
    Agent.start_link(&(%{}))
  end

  def get(bucket, key) do
    Agent.get(bucket, &(&1[key]))
  end

  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end

end
