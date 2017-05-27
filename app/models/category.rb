class Category < ActiveRecord::Base
  has_many :items

  def available_items
    items.where("inventory > 0")
  end
end
