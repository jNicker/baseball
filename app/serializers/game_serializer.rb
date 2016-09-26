class GameSerializer < ActiveModel::Serializer
  attributes :id,
            :home_team_id, :home_team_runs,
            :away_team_id, :away_team_runs,
            :created_at, :updated_at
end