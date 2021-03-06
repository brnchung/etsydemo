class Listing < ActiveRecord::Base
	if Rails.env.development?
	  has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg"
	else 
	  has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg",
	   				    :storage => :dropbox,
      				    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
      				    :path => ":style/:id_:filename"
      # validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    end
    validates :name, :description, :price, presence: true
    validates :price, numericality: { greater_than: 0 }
    validates_attachment_presence :image

    belongs_to :user
    has_many :orders
end

# Customize the Rails Model code to be applicable to your website
# Need to validate the IMAGE input

# Three environments: Localhost = Development (testing/simulating), 
# Heroku = Production (produced live on web), x = Testing (run tests to make sure applications run smoothly)

# If in localhost, do this, else (in Heroku), import images via Dropbox
# :path will sort uploaded images by style (medium/thumbnail/etc) and assign it a name id_(enter name of photo here).jpg
# ID is the number of the listing we are creating, important, gives each file/photo a unique name

# This partition of Heroku/Localhost and Dropbox/Laptop is to avoid any possible errors when deleting listings

# can also validate listing data to make sure that name/description/price fields cannot be left blank
# presence: true just checks to see if a text field is not blank

# use belongs_to because each listing belongs to one user