require 'rails_helper'

describe Comment do
  before(:each) do
    @product = Product.create(name: 'Test Product', description: 'Test Description', color: 'brown', price: 10)
    @user = FactoryBot.create(:user)
  end

  context 'when comment does not have required attributes' do

    it 'is not valid without a rating' do
      expect(Comment.new(user_id: 1, product_id: @product.id, body: 'Awful product!', rating: nil)).not_to be_valid
    end

    it 'is not valid without a body' do
      expect(Comment.new(user_id: 1, product_id: @product.id, body: nil, rating: 1)).not_to be_valid
    end

    it 'is valid with a body and rating' do
      expect(Comment.new(user_id: 1, product_id: @product.id, body: 'Awful product!', rating: 1)).to be_valid
    end
  end
end
