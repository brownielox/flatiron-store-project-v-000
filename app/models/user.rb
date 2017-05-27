class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  has_one :current_cart, class_name: 'Cart'

  def new_current_cart
    new_cart = carts.create
    self.cart_id = new_cart.id
    save
  end

  def remove_cart
    self.cart_id = nil
    save
  end
end
