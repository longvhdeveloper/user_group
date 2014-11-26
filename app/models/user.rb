# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string(255)
#  encrypted_password :string(20)
#  name               :string(255)
#  profile            :text
#  is_admin           :boolean          default(FALSE)
#  created_at         :datetime
#  updated_at         :datetime
#  salt               :string(40)
#

require 'digest'
class User < ActiveRecord::Base

  has_many :presentations

  #unencrtyped password
  attr_accessor :password

  # validation
  validates :email, :presence => true,
                    :length => {:maximum => 255},
                    :uniqueness => {:case_sensitive => false}

  validates :name , :presence => true

  validates :password, :presence => true,
                      :length => {in: 4..20},
                      :confirmation => true,
                      :if => :password_required?

  validates :password_confirmation, :presence => true,
                                    :if => :password_required?


  # call back
  before_save :encrypt_password

  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("#{password}#{salt}")
  end

  # authenticate by email / password
  def self.authenticate(email, password)
    user = find_by_email(email)
    user && user.authenticated?(password) ? user : nil
  end

  # does the given password match the stored encrypted password
  def authenticated?(password)
    encrypted_password == User.encrypt(password, salt)
  end

  private

  def password_required?
    encrypted_password.blank? || !password.blank?
  end

  # before save - create salt , encrypt password
  def encrypt_password
    return if password.blank?
    if new_record?
      self.salt = Digest::SHA1.hexdigest("#{Time.zone.now}#{email}")
    end
    self.encrypted_password = User.encrypt(password, salt)
  end

end