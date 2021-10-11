class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name, null: false
      t.integer :api_id, null: false
      t.integer :base_experience, null: false
      t.string :slug, null: false
      t.references :player, foreign_key: true

      t.timestamps
    end
    add_index :pokemons, :slug, unique: true
  end
end
