# encoding: utf-8

class ProfilePictureUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  include CarrierWave::Processing::RMagick
  include CarrierWave::ImageOptimizer

  # Choose what kind of storage to use for this uploader:
  # storage :fog
  storage :file

  # Override the directory where uploaded files will be stored.
  def store_dir
    "#{model.class.to_s.pluralize.parameterize}/#{model.id}/"
  end

  # Optimize the file size
  process :optimize => [{ quality: 90 }]

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fill => [48, 48]
  end

  version :small do
    process :resize_to_fill => [128, 128]
  end

  version :large do
    process :resize_to_fill => [512, 512]
  end


  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  def filename
    if original_filename
      "#{model.name.parameterize}-#{secure_token(8)}.#{file.extension}"
    end
  end


  # for image size validation
  # fetching dimensions in uploader, validating it in model
  attr_reader :width, :height
  before :cache, :capture_size
  def capture_size(file)
    if version_name.blank? # Only do this once, to the original version
      if file.path.nil? # file sometimes is in memory
        img = Magick::Image.read(current_path)
        @width = img[0].columns
        @height = img[0].rows
      else
        @width, @height = `identify -format "%wx %h" #{file.path}`.split(/x/).map{|dim| dim.to_i }
      end
    end
  end

  protected

  def secure_token(length=16)
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
  end

end
