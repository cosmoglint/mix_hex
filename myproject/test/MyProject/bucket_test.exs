defmodule MyProject.BucketTest do
  use ExUnit.Case, async: true

  # this is a callback function that runs before every test. we call the callback with the test function, it is in the samme process as the test itself. since the bucket id is required, we return a dictionary and this is in the context of the test itself
  setup do
    {:ok, bucket} = MyProject.Bucket.start_link([])
    %{:bucket, bucket}
  end

  test "stores key by value", %{:bucket, bucket} do
    # here the bucket is bucket from the setup function
    assert MyProject.Bucket.get(bucket, "milk") == nil`

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
