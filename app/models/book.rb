class Book < ApplicationRecord
    belongs_to :user
    validates :title, :author, :description, :user, presence: true
    validates :title, length: {in: 3..30}
    validates :author, length: {in: 3..30}
    validates :description, length: {in: 30..300}
    acts_as_taggable
    mount_uploader :cover, CoverUploader
    scope :index, -> {where("created_at >= ? and published = ?", Time.zone.now.beginning_of_day - 1.week, true)}
end
