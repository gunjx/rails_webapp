require 'rails_helper'

describe ProductsController, type: :controller do

  context 'GET #index' do
    
    it 'renders index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context 'GET #new' do

    it 'renders new template' do
      get :new
      expect(response).to be_ok
      expect(response).to render_template('new')
    end
  end

  context 'GET #edit' do
    before do
      @product = Product.create(name: 'Test Product', description: 'Test Description', color: 'brown', price: 10)
    end

    it 'renders edit template' do
      get :edit, params: { id: @product.id }
      expect(response).to be_ok
      expect(response).to render_template('edit')
    end
  end

  context 'GET #show' do
    before do
      @product = Product.create(name: 'Test Product', description: 'Test Description', color: 'brown', price: 10)
    end

    it 'renders show template' do
      get :show, params: { id: @product.id }
      expect(response).to be_ok
      expect(response).to render_template('show')
    end
  end

  context 'POST #create' do
    before do
      @user = FactoryBot.create(:user)
    end

    it 'creates product and renders product template' do
      @product = Product.create(name: 'Test Product', description: 'Test Description', color: 'brown', price: 10)
      post :create, params: { product: { name: @product.name, description: @product.description, price: @product.price, color: @product.color} }
      expect(response).to redirect_to(action: :show, id: assigns(:product).id)
    end
  end

  context 'POST #update' do
    before do
      @product = Product.create(name: 'Test Product', description: 'Test Description', color: 'brown', price: 10)
    end

    it 'updates product attributes' do
      @update = { name: 'Hipster Product'}
      post :update, params: {id: @product.id, product: @update }
      @product.reload
      expect(@product.name).to eq 'Hipster Product'
    end
  end

  context 'DELETE #destroy' do
    before do
      @product = Product.create(name: 'Test Product', description: 'Test Description', color: 'brown', price: 10)
    end

    it 'destroys product and redirects to products_path' do
      delete :destroy, params: { id: @product.id }
      expect(response).to redirect_to products_path
    end
  end
end
