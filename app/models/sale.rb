class Sale < ApplicationRecord
  belongs_to :good

  validates :date, :revenue, :good, presence: true

  def self.total_revenue(start_date, end_date)
    sum_revenue = 0
    where(date: start_date..end_date).each do |sale|
      sum_revenue += sale.revenue
    end
    return sum_revenue
  end
end
