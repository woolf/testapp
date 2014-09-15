class Photo < ActiveRecord::Base
  belongs_to :monument
  belongs_to :collection
  belongs_to :user

  has_attached_file :image, :styles => { :original => "750x500>", :medium => "555x317>", :thumb => "263x158>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
