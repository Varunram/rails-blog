class Recipe < ActiveRecord::Base
  has_many :ingredients
  has_many :directions
  accepts_nested_attributes_for :ingredients
  accepts_nested_attributes_for :directions

  validates :title, :description, presence: true
  validates :image, presence: false
  has_attached_file :image, styles: { medium: "400x400#>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
