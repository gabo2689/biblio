class Author < ActiveRecord::Base
  has_many :books
  validates_presence_of :name, :email
  validates_uniqueness_of :email, allow_blank: false

  has_secure_password


end
