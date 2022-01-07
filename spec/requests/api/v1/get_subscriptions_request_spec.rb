require 'rails_helper'

describe 'Customers API Subscriptions Index' do
  context 'Happy Path' do
    it 'can get all subscriptions of one customer by id' do
      brew = create(:tea)
      client = create(:customer)
      id = client.id
      create_list(:subscription, 4, customer: client, tea: brew)

      get "/api/v1/customers/#{id}/subscriptions"

      subs = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(subs.size).to eq(4)

      subs.each do |sub|
        expect(sub).to have_key(:id)
        expect(sub[:id].to_i).to be_an(Integer)

        expect(sub).to have_key(:attributes)
        expect(sub[:attributes]).to be_an(Hash)

        expect(sub[:attributes]).to have_key(:title)
        expect(sub[:attributes][:title]).to be_a(String)
      end
    end
  end

  context 'Sad Path' do
    it 'can not get all subscriptions without customer id' do
      brew = create(:tea)
      client = create(:customer)
      id = nil
      create_list(:subscription, 4, customer: client, tea: brew)

      get "/api/v1/customers/#{id}/subscriptions"
      json = JSON.parse(response.body)

      expect(response).to_not be_successful

      expect(json).to be_a(Hash)
      expect(json).not_to have_key('data')
      expect(json).to have_key('code')
      expect(json['code']).to be_a(Integer)
      expect(json['code']).to eq(404)

      expect(json).to have_key('error')
      expect(json['error']).to be_a(String)
      expect(json['error']).to eq("Customer does not exist")
    end
  end
end
