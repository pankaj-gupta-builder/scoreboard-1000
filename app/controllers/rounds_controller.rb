class RoundsController < ApplicationController
  before_action :set_game, only: [:create, :index, :show, :update, :destroy]
  before_action :set_round, only: [:show, :update, :destroy]

  # GET /rounds
  def index
    render json: @game.rounds
  end

  # GET /rounds/1
  def show
    render json: @round
  end

  # POST /rounds
  def create
    render json: 'Game has been already completed', status: :bad_request and return if @game.winner.present? || @game.status == 'completed'
    render json: 'Invalid Scores, Sum is not equal to 360', status: :unprocessable_entity and return if round_params[:scores].values.sum != 360

    @round = Round.new(round_params)

    if @round.save
      render json: @round, status: :created
    else
      render json: @round.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rounds/1
  def update
    if @round.update(round_params)
      render json: @round
    else
      render json: @round.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rounds/1
  def destroy
    @round.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round
      @round = Round.find(params[:id])
    end

    def set_game
      @game = Game.find(params[:game_id])
    end

    # Only allow a list of trusted parameters through.
    def round_params
      params.require(:round).permit(:game_id, :scores=> {})
    end
end
