class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy, :add_players]

  # GET /games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/1
  def show
    render json: @game
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def add_players
    players.each { |player| @game.players << player }
    render json: @game.players
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    def players
      @players ||= Player.where(id: add_players_params["players"])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:status, :name)
    end

    def add_players_params
      params.permit(:players => [])
    end
end
