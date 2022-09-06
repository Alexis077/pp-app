require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do
  include JsonWebToken
  let!(:user) { FactoryBot.create(:user) }
  let!(:token) { jwt_encode(user_id: user.id) }
  let!(:headers) { { 'Authorization': token } }

  describe 'GET #most_demanded' do
    context 'get most demanded products' do
      it 'success response' do
        request.headers.merge!(headers)
        get(:most_demanded)      
        json_response = JSON.parse(response.body)  
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET #top_incomes' do
    context 'get top of incomes' do
      it 'success response' do
        request.headers.merge!(headers)
        get(:top_incomes)      
        json_response = JSON.parse(response.body)  
        expect(response.status).to eq(200)
      end
    end
  end
end
