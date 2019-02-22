class AddGoodsIdToSales < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :sales, :good, foreign_key: true
  end
end
