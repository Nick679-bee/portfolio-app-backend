class User < ActiveRecord::Base
  # our active record many to one associations
  has_many :projects
  has_many :skills
  # table consists of passwprd hashes as a column to store password as hashes in the db
  include BCrypt

  # retrieve password from hash
  def password
    @password ||= Password.new(password_hash)
  end

  # create the password hash
  def password=(new_pass)
    @password = Password.create(new_pass)
    self.password_hash = @password
  end
end