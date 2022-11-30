class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :order_number

      t.integer :order_status, default: 0
      t.decimal :deposit_money, default: 0
      t.decimal :sub_total, default: 0
      t.decimal :total, default: 0




      t.timestamps
    end
  end
end
