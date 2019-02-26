class PhotoTripUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
