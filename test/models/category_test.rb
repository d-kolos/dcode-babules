require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "categories_count" do
    assert_equal 10, Category.count
  end
end
