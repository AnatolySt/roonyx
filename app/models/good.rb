class Good < ApplicationRecord
  has_many :sales

  validates :title, presence: true

  def revenue(start_date, end_date)
    sum_revenue = 0
    sales.where(date: start_date..end_date).each do |sale|
      sum_revenue += sale.revenue
    end
    return sum_revenue
  end
end
