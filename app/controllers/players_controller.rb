class PlayersController < ApplicationController
  def index
    @players = Player.includes(:pokemons).all
  end

  def choose_players
    if params[:player_ids].present? && params[:player_ids].length == 2
      session[:player_ids] = params[:player_ids].map(&:to_i)
      redirect_to pokemons_path
    else
      @players = Player.includes(:pokemons).all
      render :index
    end
  end
end
