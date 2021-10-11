class TradeObject < ApplicationRecord
  belongs_to :player
  belongs_to :trade
  has_and_belongs_to_many :pokemons
end
