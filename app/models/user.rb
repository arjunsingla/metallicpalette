class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pieces, dependent: :destroy
  has_attached_file :avatar, styles: { medium: "200x200>", thumb: "150x150>" }, default_url: "https://s3.amazonaws.com/metallicpalette/default-avatar.jpg"
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  validates :name, presence: true
  validates :address_line_1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true, numericality: { only_integer: true }
  validates_presence_of :terms_and_conditions, :message => "must be accepted"
end
