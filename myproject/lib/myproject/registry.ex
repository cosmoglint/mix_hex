defmodule MyProject.Registry do
  use GenServer

  # add client api Here

  @impl true
  def init(:ok) do
    {:ok, %{}}
  end

  @impl true
  def handle_call({:lookup, name}, _from, names) do
    {:reply, Map.fetch(names, name), names}
  end

  @impl true
  def handle_cast({:create, name}, names) do
    # if the bucket already has the same key do nothing
    if Map.has_key?(names,name)do
      {:noreply, names}
    # or create the new key
    else
      {:ok, bucket} = MyProject.Bucket.start_link([])
      {:noreply, Map.put(names,name,bucket)}
    end
  end

end
