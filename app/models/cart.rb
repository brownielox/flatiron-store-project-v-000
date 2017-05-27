class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items


  def total
    total = 0
    line_items.each do |line_item|
        total += line_item.item.price * line_item.quantity
    end
    total
  end

  def checkout
    line_items.each do |line_item|
        line_item.item.inventory = line_item.item.inventory - line_item.quantity
        line_item.item.save
    end
    self.status = 'submitted'
  end

  def add_item(item_id)
      item = Item.find(item_id)
      current = line_items.find_by(item_id: item_id)
    if current
      current.quantity += 1
      current
    else
      line_items.new(item: item)
    end
  end

end
