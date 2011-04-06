
class User < ActiveRecord::Base

  belongs_to :role

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :timeoutable, :omniauthable
  # :database_authenticatable --> Replaced by cas_authenticatable <--
  # :validatable, :lockable, :rememberable, :registerable
  devise :cas_authenticatable, :recoverable, :trackable

  validates_format_of :username, 
    :with => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i,
    :message => "Please enter a valid email address."
  validates_uniqueness_of :username,
    :message => "The email address you entered already exists."

  validates_length_of :password, :in => 6..20, 
    :if => :should_validate_password
  validates_confirmation_of :password, :message => ' did not match.', 
    :if => :should_validate_password

  validates_length_of :first_name, :minimum => 3
  validates_length_of :last_name, :minimum => 3 

  #  
  # Only validate the password under these conditions.
  # - User doesn't exist.
  # - User edits information and the password field is not blank.
  # - User requests password change via forgot password.
  #   
  def should_validate_password
    if self.new_record?
      return true
    end 
    if User.exists?(self.id)
      if !self.reset_password_token.blank?
        return true 
      elsif !password.blank?
        return true
      else
        return false
      end
    end  
  end

  #
  # Extra Attributes defined in Ruby CAS Server
  #
  def cas_extra_attributes=(extra_attributes)
    extra_attribtues.each do |name, value|
      case name.to_sym
      when :first_name
        self.first_name = value
      when :last_name
        self.last_name = value
      when :role_id
        self.role_id = value
      end
    end
  end

end
