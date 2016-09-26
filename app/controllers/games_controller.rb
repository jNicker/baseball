class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]
  after_action only: [:index] { set_pagination_header(:games) }

  # GET /games
  def index
    @games = Rails.cache.fetch("games", expires_in: 5.minutes) do
      Game.all
    end
    @games = @games.page(params[:page])
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
      @game = Rails.cache.fetch("games/#{params[:id]}", expires_in: 5.minutes) do
        Game.find(params[:id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      params.require(:game).permit(:home_team_id, :away_team_id)
    end
end
