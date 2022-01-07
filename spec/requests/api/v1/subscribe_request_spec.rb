require 'rails_helper'

RSpec.describe 'Subscriptions API create sub' do
  it 'can create a new sub' do
    client = create(:customer)
    brew = create(:tea)
    sub_params = {
                    title: 'Some Tea',
                    status: "paused",
                    price: 43.12,
                    frequency: "bi_monthly",
                    customer_id: client.id,
                    tea_id: brew.id
                  }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post "/api/v1/customers/#{client.id}/subscriptions", headers: headers, params: JSON.generate(subscription: sub_params)
    # post "/api/v1/customers/#{client.id}/subscriptions", params:  sub_params

    created_sub = Subscription.last

    expect(response).to be_successful
    expect(response).to have_http_status(201)

    expect(created_sub.title).to eq(sub_params[:title])
    expect(created_sub.status).to eq(sub_params[:status])
    expect(created_sub.price).to eq(sub_params[:price])
    expect(created_sub.frequency).to eq(sub_params[:frequency])
  end
end
