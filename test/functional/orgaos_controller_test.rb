require 'test_helper'

class OrgaosControllerTest < ActionController::TestCase
  setup do
    @orgao = orgaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orgaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orgao" do
    assert_difference('Orgao.count') do
      post :create, orgao: { dt_fim: @orgao.dt_fim, dt_inicio: @orgao.dt_inicio, id_lei: @orgao.id_lei, nm_orgao: @orgao.nm_orgao }
    end

    assert_redirected_to orgao_path(assigns(:orgao))
  end

  test "should show orgao" do
    get :show, id: @orgao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orgao
    assert_response :success
  end

  test "should update orgao" do
    put :update, id: @orgao, orgao: { dt_fim: @orgao.dt_fim, dt_inicio: @orgao.dt_inicio, id_lei: @orgao.id_lei, nm_orgao: @orgao.nm_orgao }
    assert_redirected_to orgao_path(assigns(:orgao))
  end

  test "should destroy orgao" do
    assert_difference('Orgao.count', -1) do
      delete :destroy, id: @orgao
    end

    assert_redirected_to orgaos_path
  end
end
