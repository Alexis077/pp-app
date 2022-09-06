require 'rails_helper'

RSpec.describe Api::V1::PurchasesController, type: :controller do
  include JsonWebToken
  let!(:user) { FactoryBot.create(:user) }
  let!(:token) { jwt_encode(user_id: user.id) }
  let!(:headers) { { 'Authorization': token } }

  describe 'GET #index' do
    context 'get purchases' do
      it 'success response' do
        request.headers.merge!(headers)
        get(:index)      
        json_response = JSON.parse(response.body)
        json_response.each do |purchase|
          purcase_items = purchase['purcase_items']
          expect(purchase['total_products']).eq(purcase_items.sum { _1['quantity'] })
          expect(purchase['total_amount']).eq(purcase_items.sum { _1['quantity'] * _1['total'] })
        end
        expect(response.status).to eq(200)
      end
    end
  end
end
