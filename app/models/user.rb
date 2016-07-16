class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :pieces, dependent: :destroy

   validates :name, presence: true
   validates :address_line_1, presence: true
   validates :address_line_2, presence: true

end
