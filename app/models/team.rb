class Team < ApplicationRecord
  has_many :players
  has_many :games
  has_many :runs

  scope :top, -> { order(runs_count: :desc) }

end
