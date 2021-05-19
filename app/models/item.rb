class Item < ApplicationRecord
  with_options presense: true do
    validates :name
    validates :text
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :delivery_days_id 
    validates :price
  end

  belongs_to :user
  
end
