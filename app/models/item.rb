class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_day
  


  validates :item_name, presence: true
  validates :text, presence: true
  validates :price, presence: true

  validates :category_id, numericality: {other_then: 1}
  validates :status_id, numericality: {other_then: 1}
  validates :delivery_charge_id, numericality: {other_then: 1}
  validates :prefecture_id, numericality: {other_then: 1}
  validates :delivery_day_id, numericality: {other_then: 1}


  belongs_to :user

  
end
