class AddStockIdToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :stock_id, :integer
  end
end
