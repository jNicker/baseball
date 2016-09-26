class Video < ApplicationRecord
  belongs_to :player
  has_attached_file :video
  validates_attachment :video, presence: true
end
