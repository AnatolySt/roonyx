require 'rails_helper'

RSpec.describe Sale do
  it { should belong_to(:good) }
  it { should validate_presence_of(:good) }
  it { should validate_presence_of(:revenue) }
  it { should validate_presence_of(:date) }

  let(:first_sale) { create(:first_sale) }
  let(:last_sale) { create(:last_sale) }

  it 'returns sum of all revenues for selected time period' do
    expect(Sale.total_revenue(first_sale.date, last_sale.date).to_i).to eql(150000)
  end
end
