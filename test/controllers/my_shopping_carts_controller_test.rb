require 'test_helper'

class MyShoppingCartsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get my_shopping_carts_create_url
    assert_response :success
  end

  test "should get destroy" do
    get my_shopping_carts_destroy_url
    assert_response :success
  end

end
