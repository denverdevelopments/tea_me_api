require 'rails_helper'

RSpec.describe "Subscriptions API create sub" do
  it "can create a new sub" do
    customer1 = create(:customer)
    sub_params = {
                    name: 'Some Item',
                    description: 'Filled with stuff.',
                    unit_price: 43.12,
                    customer_id: customer1.id
                  }
    headers = {"CONTENT_TYPE" => "application/json"}


    post "/api/v1/subs", headers: headers, params: JSON.generate(sub: sub_params)

    created_sub = Item.last

    expect(response).to be_successful
    expect(response).to have_http_status(200)

    expect(created_sub.name).to eq(sub_params[:name])
    expect(created_sub.description).to eq(sub_params[:description])
    expect(created_sub.unit_price).to eq(sub_params[:unit_price])
  end
end
