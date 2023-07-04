require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    # get reports_index_url
    get '/reports'
    assert_response :success
  end

  test "should get report_by_category" do
    #noinspection RubyResolve
    get reports_report_by_category_url
    assert_response :success
    get '/reports/report-by-category'
    assert_response :success
  end

  test "should get report_by_dates" do
    #noinspection RubyResolve
    get reports_report_by_dates_url
    assert_response :success
    get "/reports/report-by-dates"
    assert_response :success
  end
end
