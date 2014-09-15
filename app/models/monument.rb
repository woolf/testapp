class Monument < ActiveRecord::Base
  validates :name, :presence => true
  belongs_to :category
  validates :category_id, :presence => true
  validates_associated :category
  belongs_to :collection
  validates :collection_id, :presence => true
  validates_associated :collection

  has_many :photos

  def ownered_by? user
    return false if user.nil?
    if collection.user == user
      true
    else
      false
    end
  end
end
