require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    # get pages_index_url
    get '/'
    assert_response :success
  end

  test "should get about" do
    # get pages_about_url
    get '/about'
    assert_response :success
  end

  test "should get framework" do
    # get pages_framework_url
    get '/framework'
    assert_response :success
  end
end
