class PlayersController < ApplicationController
  def index
    @players = Player.includes(:pokemons).all
  end

  def choose_players; end
end
