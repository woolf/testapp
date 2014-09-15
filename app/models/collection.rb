class Collection < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :user_id, presence: true
  has_many :monuments


  def owner_is? u
    return false if u.nil?
    return false if u.id != self.user.id
    true
  end
end
