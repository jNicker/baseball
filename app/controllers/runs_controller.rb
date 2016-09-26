class RunsController < ApplicationController
  before_action :set_run, only: [:show, :update, :destroy]
  after_action only: [:index] { set_pagination_header(:runs) }

  # GET /runs
  def index
    @runs = Rails.cache.fetch("runs", expires_in: 5.minutes) do
      Run.all
    end
    @runs = @runs.page(params[:page])
    render json: @runs
  end

  # GET /runs/1
  def show
    render json: @run
  end

  # POST /runs
  def create
    @run = Run.new(run_params)

    if @run.save
      render json: @run, status: :created, location: @run
    else
      render json: @run.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /runs/1
  def update
    if @run.update(run_params)
      render json: @run
    else
      render json: @run.errors, status: :unprocessable_entity
    end
  end

  # DELETE /runs/1
  def destroy
    @run.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_run
      @run = Rails.cache.fetch("runs/#{params[:id]}", expires_in: 5.minutes) do
        Run.find(params[:id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def run_params
      params.require(:run).permit(:game_id, :team_id, :player_id)
    end
end
