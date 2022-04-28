class Album < ApplicationRecord
  validates :title, :desc, :cover_image, :images, :all_tags, presence: true
  has_one_attached :cover_image
  has_many_attached :images
  belongs_to :user
  has_and_belongs_to_many :tags


  def all_tags=(names)
    self.tags=names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
  def all_tags
    tags.map(&:name).join(", ")
  end
end
