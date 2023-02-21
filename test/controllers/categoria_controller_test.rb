require "test_helper"

class CategoriaControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
    @categorium = categoria(:clothes)
  end

  test "should get index" do
    get categoria_url
    assert_response :success
  end

  test "should get new" do
    get new_categorium_url
    assert_response :success
  end

  test "should create categorium" do
    assert_difference("Categorium.count") do
      post categoria_url, params: { categorium: { name: @categorium.name } }
    end

    assert_redirected_to categoria_url
  end

  test "should get edit" do
    get edit_categorium_url(@categorium)
    assert_response :success
  end

  test "should update categorium" do
    patch categorium_url(@categorium), params: { categorium: { name: @categorium.name } }
    assert_redirected_to categoria_url
  end

  test "should destroy categorium" do
    assert_difference("Categorium.count", -1) do
      delete categorium_url(@categorium)
    end

    assert_redirected_to categoria_url
  end
end