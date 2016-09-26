class Player < ApplicationRecord
  has_attached_file :photo
  do_not_validate_attachment_file_type :photo

  has_many :videos
  attr_accessor :video_data


  belongs_to :team

  has_many :runs

  scope :top, -> { order(runs_count: :desc) }

  def save_videos(params)
    params[:video_data].each do |vid|
      self.videos.create(:video => vid)
    end
  end

end
