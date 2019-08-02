class Theme < ApplicationRecord
  belongs_to :user
  has_many :answers
  validates :text, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
end
