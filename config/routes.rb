Rails.application.routes.draw do
  root to: 'players#index'

  get  'players'        => 'players#index',          as: :players
  post 'players/choose' => 'players#choose_players', as: :choose_players

  get  'pokemons'         => 'pokemons#index',           as: :pokemons
  post 'pokemons/compare' => 'pokemons#compare_pokemons', as: :compare_pokemons

  post 'trade'  => 'traders#new',   as: :trade
  get  'trades' => 'traders#index', as: :trades
end
