class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_one :purchase_record
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :estimated_shipping_date


  validates :image, :product_name, :product_description, :price, presence: true
  validates :category_id, :estimated_shipping_date_id, :item_condition_id, :shipping_area_id, :shipping_fee_id, numericality: { other_than: 1 }
  validates :price, numericality: { in: 300..9999999, only_integer: true }

end
