defmodule MyProject.Registry do
  use GenServer

  # add client api Here
  @doc"""
  start the registry
  """
  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end


  @doc"""
  looks up the bucket for 'name' stored in 'server',
  returns {:ok, pid} if  bucket exists, :error otherwise
  """
  def lookup(server,name) do
    GenServer.call(server, {:lookup, name})
  end

  @doc"""
  ensures if a bucket with the given name exists
  """
  def create(server,name, value) do

  end

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
