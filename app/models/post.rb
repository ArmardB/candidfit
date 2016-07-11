class Post < ApplicationRecord
	
	# before_save :upload_to_s3

	has_attached_file :image, styles: { medium: "500x500>", thumb: "100x100>" },
     :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :user

  private

  # require 'aws-sdk'

  # def upload_to_s3
  # 	s3 = Aws::S3::Resource.new
  # 	fit_user = User.find(Thread.current[:user_id])
		# obj = s3.bucket(ENV['AWS_S3_BUCKET']).object("#{fit_user}/#{image_file_name}")
		# obj.upload_file(upload.path, acl:'public-read')
		# self.key = obj.public_url
  # end

end
