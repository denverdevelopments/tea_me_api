require 'rails_helper'

RSpec.describe 'Subscriptions API destroy sub' do
  it 'can destroy an sub' do
    sub1 = create(:sub)

    expect(Book.count).to eq(1)

    delete "/api/v1/subs/#{sub.id}"

    expect(response).to be_successful
    expect(Book.count).to eq(0)
    expect{Book.find(sub.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
