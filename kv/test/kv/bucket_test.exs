defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    # {:ok, bucket} = KV.Bucket.start_link([])
    bucket = start_supervised!(KV.Bucket)
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "milk") == nil

    KV.Bucket.set(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
  end

  test "remove stored value by key", %{bucket: bucket} do
    KV.Bucket.set(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3

    KV.Bucket.remove(bucket, "milk")
    assert KV.Bucket.get(bucket, "milk") == nil
  end
end
