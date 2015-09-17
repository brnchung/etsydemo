class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  has_many :listings, dependent: :destroy
  has_many :sales, class_name: "Order", foreign_key: "seller_id"
  has_many :purchases, class_name: "Order", foreign_key: "buyer_id"  
end

# dependent destroy means a listing's existence depends on the user, user deleted means all of their listings are deleted also
# foreign key tells rails to use the seller id in the order database to figure out which user sold the item 
# (and vice versa, use buyer id to find out who bought the item)