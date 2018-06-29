#*app/uploaders/photo_uploader.rb* 
class PhotoUploader < CarrierWave::Uploader::Base
 
  include CarrierWave::MiniMagick

  storage :file

  version :thumb do
    process resize_to_fill:[200,200]
  end
    
  version :full do
    process resize_to_fill:[400,400]
  end
    
  end
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end