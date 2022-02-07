require "test_helper"

class BalancesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get balances_new_url
    assert_response :success
  end
end
