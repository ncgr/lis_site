
class Admin < ActiveRecord::Base

  set_table_name "users"

  after_create :set_user_role

  devise :invitable, :database_authenticatable, :registerable,
    :encryptable, :encryptor => :authlogic_sha512

  attr_accessible :username, :password, :password_confirmation,
    :first_name, :last_name, :role_id
  
  validates_format_of :username, 
    :with => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i,
    :message => "Please enter a valid email address."
  validates_uniqueness_of :username,
    :message => "The email address you entered already exists."

  validates_length_of :password, :in => 6..20
  validates_confirmation_of :password, :message => ' did not match.'

  validates_length_of :first_name, :minimum => 3
  validates_length_of :last_name, :minimum => 3

  # 
  # Set User role to default.
  def set_user_role
    role = Role.where({:name => "system_user"}).first
    raise "Error: unable to find role: system_user" unless role
    self.update_attributes!({:role_id => role.id})
  end

end
