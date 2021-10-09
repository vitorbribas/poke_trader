class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :slug, null: false

      t.timestamps
    end
    add_index :players, :slug, unique: true
  end
end
