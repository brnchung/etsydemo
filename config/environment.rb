# Load the Rails application.
require File.expand_path('../application', __FILE__)
Paperclip.options[:image_magick_path] = "/c/Program Files/ImageMagick-6.9.2-Q16/identify"
Paperclip.options[:image_magick_path] = "/c/Program Files/ImageMagick-6.9.2-Q16/convert"

# Initialize the Rails application.
Rails.application.initialize!

