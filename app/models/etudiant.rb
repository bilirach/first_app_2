class Etudiant < ActiveRecord::Base
	validates_presence_of :first_name, :last_name, :phone_number
	validates_uniqueness_of :first_name
	mount_uploader :image, ImageUploader
end
