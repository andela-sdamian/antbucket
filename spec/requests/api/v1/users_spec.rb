require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { FactoryGirl.attributes_for :user }

  describe 'POST /users' do
    context 'when a user successfully creates an account' do
      it 'should return the user details in JSON format' do
        post api_v1_users_path, user
        user_response = json_response[:user_data]
        expect(user_response[:email]).to eq user[:email]
        expect(response.status).to eq 200
      end
    end
    context 'when a user account is not created' do
      it 'returns error message in JSON' do
        invalid_data = { email: 'james@james', password: '1234' }
        post api_v1_users_path, invalid_data
        user_response = json_response
        expect(user_response).to have_key(:errors)
        expect(response.status).to eq 422
      end
    end
  end
end
