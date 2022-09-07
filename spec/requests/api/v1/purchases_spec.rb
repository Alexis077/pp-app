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
          total_products = 0
          total_amount = 0
          purchase_items = purchase['purchase_items']
          purchase_items.each do |purchase_item|
            total_amount += purchase_item['total']
            total_products += purchase_item['quantity']
          end

          expect(purchase['total_products']).to eq(total_products)
          expect(purchase['total_amount']).to eq(total_amount)
        end

        expect(json_response.size).to eq(12)
        expect(response.status).to eq(200)
      end
    end

    context 'Use date filters' do
      it 'success response' do
        request.headers.merge!(headers)
        get(:index, params: { start_date: '04/09/2022', end_date: '06/09/2022' })
        json_response = JSON.parse(response.body)
        expect(json_response.size).to eq(2)
        expect(response.status).to eq(200)
      end
    end

    context 'Use date filters' do
      it 'success response' do
        request.headers.merge!(headers)
        get(:index, params: { product_id: '1' })
        json_response = JSON.parse(response.body)
        expect(json_response.size).to eq(8)
        expect(response.status).to eq(200)
      end
    end

    context 'Use date filters' do
      it 'success response' do
        request.headers.merge!(headers)
        get(:index, params: { category_id: '4' })
        json_response = JSON.parse(response.body)
        expect(json_response.size).to eq(4)
        expect(response.status).to eq(200)
      end
    end
  end
end
