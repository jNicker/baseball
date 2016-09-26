class Game < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
  has_many :runs

  def home_team_runs
    runs.where(team_id: home_team_id).count
  end

  def away_team_runs
    runs.where(team_id: away_team_id).count
  end

end
