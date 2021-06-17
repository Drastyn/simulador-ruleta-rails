class PlayersController < ApplicationController

  before_action :set_player, only: [:show, :edit, :update]

  def index
    @players = Player.players_data
  end

  def new
    @player = Player.new
  end

  def show
  end

  def create
    @player = Player.new(new_player_params)
    if @player.save
      redirect_to players_url, :flash => { :success => "Jugador registrado" }
    else
      redirection(register_player_url, "Jugador no registrado, #{@player.errors.full_messages.first}")
    end
  end

  def edit
    redirection(players_url, "Jugador no encontrado") if !@player
  end

  def update
    @player.update(update_player_params)
    if @player.save
      redirect_to players_url, :flash => { :success => "Jugador actualizado" }
    else
      redirection(player_edit_url, "Jugador no registrado, #{@player.errors.full_messages.first}")
    end
  end

  private

  def set_player
    @player = Player.players_data.find_by_token(params[:token])
  end

  def new_player_params
    params.require(:player).permit(:name, :age, :mount)
    .with_defaults(token: Digest::MD5.hexdigest(Time.now.to_s + ('a'.. 'z').to_a.sample(5).to_s))
  end

  def update_player_params
    params.require(:player).permit(:name, :age, :mount)
  end

end