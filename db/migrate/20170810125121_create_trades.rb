class CreateTrades < ActiveRecord::Migration[5.1]
  def change
    create_table :trades do |t|
      t.decimal :amount
      t.references :account

      t.timestamps
    end
  end
end
