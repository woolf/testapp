require 'digest'

class User < ActiveRecord::Base
  validates :login, presence: true, uniqueness: true
  validates :login, length: { in: 4..250 }, unless: Proc.new { |u| u.login.blank? }
  validates :password, presence: true
  validates :password, length: { in: 4..250 }, unless: Proc.new { |u| u.password.blank? }
  validates :password, confirmation: true, unless: Proc.new { |u| u.password.blank? }

  has_many :collections

  before_create { |u| u.password = Digest::MD5.hexdigest(u.password) }

  def self.authorize p
    user = find_by_login p[:"/users/login"][:login]

    if user.nil?
      return :login, "not found"
    end

    if user.password != Digest::MD5.hexdigest(p[:"/users/login"][:password])
      return :password, "mismatch"
    end

    user
  end
end
