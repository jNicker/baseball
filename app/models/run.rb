class Run < ApplicationRecord
  belongs_to :game
  belongs_to :team, counter_cache: true
  belongs_to :player, counter_cache: true
end
