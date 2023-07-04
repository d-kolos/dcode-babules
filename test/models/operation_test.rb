require "test_helper"

class OperationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "operations_count" do
    assert_equal 110, Operation.count
  end

  test "operations_category_one_count" do
    assert_equal 20, Operation.joins(:category).where({ categories: { name: 'Продукти харчування' } }).count
  end

  test "operations_category_two_count" do
    assert_equal 10, Operation.joins(:category).where({ categories: { name: 'Харчування' } }).count
  end

end
