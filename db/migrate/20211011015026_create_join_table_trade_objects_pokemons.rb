class CreateJoinTableTradeObjectsPokemons < ActiveRecord::Migration[6.1]
  def change
    create_join_table :trade_objects, :pokemons do |t|
      t.index [:trade_object_id, :pokemon_id]
      t.index [:pokemon_id, :trade_object_id]
    end
  end
end
