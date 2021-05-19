class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_day
  

  
  with_options presence: true do
    validates :item_name
    validates :text
    validates :price
    validates :image

    validates :category_id, numericality: {other_than: 1}
    validates :status_id, numericality: {other_than: 1}
    validates :delivery_charge_id, numericality: {other_than: 1}
    validates :prefecture_id, numericality: {other_than: 1}
    validates :delivery_day_id, numericality: {other_than: 1}
  end

  belongs_to :user
  has_one_attached :image

  
end
