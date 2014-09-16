class Category < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  before_destroy { |record| Monument.where(:category_id => record.id).count > 0 ? false : true }
end
