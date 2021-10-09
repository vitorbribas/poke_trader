Rails.application.routes.draw do
  get  'players'        => 'players#index',          as: :players
  post 'players/choose' => 'players#choose_players', as: :choose_players
end
