class CreateTradeObjects < ActiveRecord::Migration[6.1]
  def change
    create_table :trade_objects do |t|
      t.references :player, null: false, foreign_key: true
      t.references :trade, null: false, foreign_key: true

      t.timestamps
    end
  end
end
