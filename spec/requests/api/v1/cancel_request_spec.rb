require 'rails_helper'

RSpec.describe 'Subscriptions API update' do
  it 'can edit a subscription to cancel' do
    client = create(:customer)
    brew = create(:tea)
    sub1 = create(:subscription, customer: client, tea: brew, status: 0)

    edit_params = {
                    status: "cancelled",
                    tea_id: brew.id
                  }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    patch "/api/v1/customers/#{client.id}/subscriptions/#{sub1.id}", headers: headers, params: JSON.generate(edit_params)

    parsed = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

    edited_sub = Subscription.find(sub1.id)
    # binding.pry

    expect(response).to be_successful
    expect(sub1.status).to eq("active")
    expect(sub1.status).to_not eq(edited_sub)
    expect(edited_sub.status).to eq("cancelled")
    end
end
