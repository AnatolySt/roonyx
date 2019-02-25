class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.float :revenue
      t.date :date
      t.timestamps
    end
  end
end
