require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get adminhome" do
    get pages_adminhome_url
    assert_response :success
  end

  test "should get studenthome" do
    get pages_studenthome_url
    assert_response :success
  end

  test "should get librarianhome" do
    get pages_librarianhome_url
    assert_response :success
  end

end
