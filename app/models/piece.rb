class Piece < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :large => "500x500>", :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	validates :title, presence: true
	validates :image, presence: true
	validates :genre, presence: true
	validates :size, presence: true
	validates :price, presence: true, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0, :less_than => 10}
	validates :description, presence: true



end
