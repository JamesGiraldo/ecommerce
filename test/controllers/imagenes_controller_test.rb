require 'test_helper'

class ImagenesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get imagenes_new_url
    assert_response :success
  end

  test "should get edit" do
    get imagenes_edit_url
    assert_response :success
  end

  test "should get form" do
    get imagenes_form_url
    assert_response :success
  end

end
