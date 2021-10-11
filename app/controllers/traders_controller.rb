class TradersController < ApplicationController
  def new
    pokemons = Pokemon.where(id: session[:pokemon_ids])
    first_player_pokemons = pokemons.select { |p| p.player_id == session[:player_ids].first }
    second_player_pokemons = pokemons.select { |p| p.player_id == session[:player_ids].second }
    first_player_pokemons.map { |p| p.update(player_id: session[:player_ids].second) }
    second_player_pokemons.map { |p| p.update(player_id: session[:player_ids].first) }

    trade = Trade.create()
    first_trade_object = TradeObject.create(player_id: session[:player_ids].first, trade_id: trade.id)
    first_trade_object.pokemons << first_player_pokemons
    second_trade_object = TradeObject.create(player_id: session[:player_ids].second, trade_id: trade.id)
    second_trade_object.pokemons << second_player_pokemons

    redirect_to trades_path
  end

  def index
    @trades = Trade.includes(trade_objects: [:player, :pokemons_tradeobjects, :pokemons]).order('created_at DESC')
  end
end
