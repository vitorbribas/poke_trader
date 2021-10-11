class PokemonsController < ApplicationController
  def index
    return redirect_to players_path unless session[:player_ids]&.present?

    @pokemons = Pokemon.where(player_id: session[:player_ids])
  end

  def compare_pokemons
    if params[:pokemon_ids].present?
      pokemons = Pokemon.where(id: params[:pokemon_ids].map(&:to_i))
      comparison_one = pokemons.select do |p|
        p.player_id == session[:player_ids].first
      end&.sum(&:base_experience) || 0
      comparison_two = pokemons.select do |p|
        p.player_id == session[:player_ids].second
      end&.sum(&:base_experience) || 0

      @comparison_result = (comparison_one - comparison_two).abs <= 50

      session[:pokemon_ids] = params[:pokemon_ids].map(&:to_i)
    end

    respond_to do |format|
      format.js { render layout: false }
    end
  end
end
