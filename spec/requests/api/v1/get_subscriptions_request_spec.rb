require 'rails_helper'

describe 'Customers API Subscriptions Index' do
  it 'can get all subs of one customer by id' do
    client = create(:customer)
    id = client.id
    create_list(:sub, 4, customer: client)

    get "/api/v1/customers/#{id}/subs"

    subs = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(subs.count).to eq(4)

    subs.each do |sub|
      expect(sub).to have_key(:id)
      expect(sub[:id].to_i).to be_an(Integer)

      expect(sub[:attributes]).to have_key(:name)
      expect(sub[:attributes][:name]).to be_a(String)
    end
  end
end
