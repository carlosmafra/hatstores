class Admin::Produto < ActiveRecord::Base
	mount_uploader :image, ImageUploader
end
