require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) { User.create!(email: 'peter@example.com', password: '1234567890') }
  let(:user2) { User.create!(email: 'joe@example.com', password: 'qwertz') }

  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
        sign_in user
      end

      it 'loads correct user data' do
        get :show, params: { id: user.id }
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
      end

      it 'cannot access other users show page' do
        get :show, params: { id: user2.id }
        expect(response).to have_http_status(302)
        
      end
    end

     context 'when a user is not logged in' do
       it 'redirects to login' do
         get :show, params: { id: user.id }
         expect(response).to redirect_to(new_user_session_path)
       end
     end
  end

end
