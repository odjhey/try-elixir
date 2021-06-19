defmodule KV.Bucket do
  use Agent, restart: :temporary

  @doc """
  Starts a new bucket. Returns the PID.
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Get value from bucket by key
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Puts the `value` of the given `key` in the `bucket`
  """
  def set(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  def remove(bucket, key) do
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end
end
