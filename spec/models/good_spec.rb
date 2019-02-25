require 'rails_helper'

RSpec.describe Good do
  it { should have_many(:sales) }
  it { should validate_presence_of(:title) }

  let(:good) { create(:good) }
  let(:first_sale) { create(:first_sale, good: good) }
  let(:last_sale) { create(:last_sale, good: good) }

  it 'returns sum of revenues for selected good and time period' do
    expect(good.revenue(first_sale.date, last_sale.date).to_i).to eql(150000)
  end
end