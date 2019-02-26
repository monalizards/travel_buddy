class PhotoUserUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
