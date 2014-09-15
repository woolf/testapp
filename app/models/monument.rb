class Monument < ActiveRecord::Base
  validates :name, :presence => true
  belongs_to :category
  validates :category_id, :presence => true
  validates_associated :category
end
