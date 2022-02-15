require "test_helper"

class OneTransactionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get one_transaction_index_url
    assert_response :success
  end

  test "should get create" do
    get one_transaction_create_url
    assert_response :success
  end
end
