class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :share
      t.integer :price

      t.timestamps
    end
  end
end
