require 'poke-api-v2'

DEFAULT_PLAYERS_AMOUNT = 5
DEFAULT_POKEMONS_AMOUNT_PER_PLAYER = 10

# Players
players = FactoryBot.create_list(:player, DEFAULT_PLAYERS_AMOUNT)

# Create pokemons
players.each do |player|
  DEFAULT_POKEMONS_AMOUNT_PER_PLAYER.times do
    random_id = (1..300).to_a.sample
    random_pokemon = PokeApi.get(pokemon: random_id)
    Pokemon.create(
      player: player,
      name: random_pokemon.name,
      api_id: random_pokemon.id,
      base_experience: random_pokemon.base_experience
    )
  end
end
