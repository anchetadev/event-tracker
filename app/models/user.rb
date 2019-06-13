class User < ActiveRecord::Base
  has_secure_password
  has_many :events_attending, through: :attendees, source: :event
  has_many :attendees
  has_many :events
  validates :first_name, :last_name, :email,:location, presence: true
  validates :email, uniqueness: true, on: :create
  validates_format_of :email, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, :multiline => true,  on: :create
  before_save {|user| user.email = user.email.downcase} 
end
