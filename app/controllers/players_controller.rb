class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :update, :destroy]
  after_action only: [:index, :top] { set_pagination_header(:players) }

  # Get /players/top
  def top
    @players = Rails.cache.fetch("players/top", expires_in: 5.minutes) do
      Player.top
    end
    @players = @players.page(params[:page])
    render json: @players
  end

  # GET /players
  def index
    @players = Rails.cache.fetch("players", expires_in: 5.minutes) do
      Player.all
    end
    @players = @players.page(params[:page])
    render json: @players
  end

  # GET /players/1
  def show
    render json: @player
  end

  # POST /players
  def create
    @player = Player.new(player_params)

    if @player.save
      @player.save_videos if params[:player][:video_data]
      render json: @player, status: :created, location: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /players/1
  def update
    if @player.update(player_params)
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # DELETE /players/1
  def destroy
    @player.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Rails.cache.fetch("players/#{params[:id]}", expires_in: 5.minutes) do
        Player.find(params[:id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def player_params
      params.require(:player).permit(:name, :team_id, :photo, :video_data => [])
    end
end
