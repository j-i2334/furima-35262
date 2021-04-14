class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charges
  belongs_to :shipping_area
  belongs_to :days_to_ship

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :product_condition_id, numericality: { other_than: 1 }
  validates :shipping_charges_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 0 }
  validates :days_to_ship_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
  validates :image, presence: true

  belongs_to :user
  # has_one :purchase_record
  has_one_attached :image
end
