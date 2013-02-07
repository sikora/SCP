require 'test_helper'

class LotacoesControllerTest < ActionController::TestCase
  setup do
    @lotacao = lotacoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lotacoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lotacao" do
    assert_difference('Lotacao.count') do
      post :create, lotacao: { descricao: @lotacao.descricao, id_orgao: @lotacao.id_orgao, parent_id: @lotacao.parent_id }
    end

    assert_redirected_to lotacao_path(assigns(:lotacao))
  end

  test "should show lotacao" do
    get :show, id: @lotacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lotacao
    assert_response :success
  end

  test "should update lotacao" do
    put :update, id: @lotacao, lotacao: { descricao: @lotacao.descricao, id_orgao: @lotacao.id_orgao, parent_id: @lotacao.parent_id }
    assert_redirected_to lotacao_path(assigns(:lotacao))
  end

  test "should destroy lotacao" do
    assert_difference('Lotacao.count', -1) do
      delete :destroy, id: @lotacao
    end

    assert_redirected_to lotacoes_path
  end
end
