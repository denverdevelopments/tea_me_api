require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'relationships' do
    it { should belong_to(:customer) }
    it { should belong_to(:tea) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price) }
    it { should allow_value(:active).for(:status) }
    it { should allow_value(:paused).for(:status) }
    it { should allow_value(:cancelled).for(:status) }
    it { should allow_value(:monthly).for(:frequency) }
    it { should allow_value(:bi_monthly).for(:frequency) }
    it { should allow_value(:half_yearly).for(:frequency) }
    it { should allow_value(:yearly).for(:frequency) }
  end
end
