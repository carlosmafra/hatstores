require 'test_helper'

class Admin::ProdutosControllerTest < ActionController::TestCase
  setup do
    @admin_produto = admin_produtos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_produtos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_produto" do
    assert_difference('Admin::Produto.count') do
      post :create, admin_produto: { code: @admin_produto.code }
    end

    assert_redirected_to admin_produto_path(assigns(:admin_produto))
  end

  test "should show admin_produto" do
    get :show, id: @admin_produto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_produto
    assert_response :success
  end

  test "should update admin_produto" do
    patch :update, id: @admin_produto, admin_produto: { code: @admin_produto.code }
    assert_redirected_to admin_produto_path(assigns(:admin_produto))
  end

  test "should destroy admin_produto" do
    assert_difference('Admin::Produto.count', -1) do
      delete :destroy, id: @admin_produto
    end

    assert_redirected_to admin_produtos_path
  end
end
