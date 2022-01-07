require 'rails_helper'

describe 'Customers API Subscriptions Index' do
  it 'can get all subs of one customer by id' do
    brew = create(:tea)
    client = create(:customer)
    id = client.id
    create_list(:subscription, 4, customer: client, tea: brew)

    get "/api/v1/customers/#{id}/subscriptions"

    subs = JSON.parse(response.body, symbolize_names: true)[:data]

    binding.pry
    expect(response).to be_successful
    expect(subs.size).to eq(4)

    subs.each do |sub|
      expect(sub).to have_key(:id)
      expect(sub[:id].to_i).to be_an(Integer)

      expect(sub).to have_key(:attributes)
      expect(sub[:attributes].to_i).to be_an(Hash)

      expect(sub[:attributes]).to have_key(:title)
      expect(sub[:attributes][:title]).to be_a(String)
    end
  end
end
