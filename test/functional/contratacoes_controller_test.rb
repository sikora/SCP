require 'test_helper'

class ContratacoesControllerTest < ActionController::TestCase
  setup do
    @contratacao = contratacoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contratacoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contratacao" do
    assert_difference('Contratacao.count') do
      post :create, contratacao: { id_cargocategoria: @contratacao.id_cargocategoria, id_pessoa: @contratacao.id_pessoa, id_vaga: @contratacao.id_vaga, valor: @contratacao.valor }
    end

    assert_redirected_to contratacao_path(assigns(:contratacao))
  end

  test "should show contratacao" do
    get :show, id: @contratacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contratacao
    assert_response :success
  end

  test "should update contratacao" do
    put :update, id: @contratacao, contratacao: { id_cargocategoria: @contratacao.id_cargocategoria, id_pessoa: @contratacao.id_pessoa, id_vaga: @contratacao.id_vaga, valor: @contratacao.valor }
    assert_redirected_to contratacao_path(assigns(:contratacao))
  end

  test "should destroy contratacao" do
    assert_difference('Contratacao.count', -1) do
      delete :destroy, id: @contratacao
    end

    assert_redirected_to contratacoes_path
  end
end
