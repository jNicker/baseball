class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :photo, :runs_count, :created_at, :updated_at
  has_many :videos
end