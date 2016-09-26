class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :update, :destroy]
  after_action only: [:index, :top] { set_pagination_header(:teams) }

  # Get /teams/top
  def top
    @teams = Rails.cache.fetch("teams/top", expires_in: 5.minutes) do
      Team.top
    end
    @teams = @teams.page(params[:page])
    render json: @teams
  end

  # GET /teams
  def index
    @teams = Rails.cache.fetch("teams", expires_in: 5.minutes) do
      Team.all
    end
    @teams = @teams.page(params[:page])
    render json: @teams
  end

  # GET /teams/1
  def show
    render json: @team
  end

  # POST /teams
  def create
    @team = Team.new(team_params)
    if @team.save
      render json: @team, status: :created, location: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teams/1
  def update
    if @team.update(team_params)
      render json: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Rails.cache.fetch("teams/#{params[:id]}", expires_in: 5.minutes) do
        Team.find(params[:id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def team_params
      params.require(:team).permit(:name)
    end
end
