defmodule MyProject.BucketTest do
  use ExUnit.Case, async: true

  test "stores key by value" do
    {:ok, bucket} = MyProject.Bucket.start_link([])
    assert MyProject.Bucket.get(bucket, "milk") == nil

    MyProject.Bucket.put(bucket, "milk", 3)
    assert MyProject.Bucket.get(bucket, "milk") == 3

    # this test asserts if the delete funcitonality is working
    assert MyProject.Bucket.delete(bucket, "milk") == 3
    assert MyProject.Bucket.get(bucket, "milk") == nil

  end
end



# def MyProject.BucketTest do
#   use ExUnit.case, async: true
#
#   def setup do
#     {:ok, bucket} = MyProject.Bucket.start_link([])
#     %{ :bucket => bucket}
#   end
#
#   test "stores key by value", %{bucket: bucket} do
#     assert MyProject.Bucket.get(bucket, "milk") == nil
#
#
#     MyProject.Bucket.put(bucket, milk, 3)
#   end
# end
