require 'rails_helper'

RSpec.describe 'Subscriptions API create' do
  it 'can create a new subscription' do
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

    created_sub = Subscription.last

    expect(response).to be_successful
    expect(response).to have_http_status(201)

    expect(created_sub.title).to eq(sub_params[:title])
    expect(created_sub.status).to eq(sub_params[:status])
    expect(created_sub.price).to eq(sub_params[:price])
    expect(created_sub.frequency).to eq(sub_params[:frequency])
  end

  context 'Sad Path' do
    it 'can not create a subscription without customer id' do
      client = create(:customer)
      brew = create(:tea)
      id = 99

      sub_params = {
                      title: 'Some Tea',
                      status: "paused",
                      price: 43.12,
                      frequency: "bi_monthly",
                      customer_id: id,
                      tea_id: brew.id
                    }
      headers = { 'CONTENT_TYPE' => 'application/json' }

      post "/api/v1/customers/#{id}/subscriptions", headers: headers, params: JSON.generate(subscription: sub_params)

      json = JSON.parse(response.body)
      expect(response).to_not be_successful

      expect(json).to be_a(Hash)
      expect(json).not_to have_key('data')
      expect(json).to have_key('code')
      expect(json['code']).to be_a(Integer)
      expect(json['code']).to eq(400)

      expect(json).to have_key('error')
      expect(json['error']).to be_a(String)
      expect(json['error']).to eq("Invalid Subscription")
    end
  end
end
