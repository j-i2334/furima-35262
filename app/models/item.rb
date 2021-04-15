class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charges
  belongs_to :shipping_area
  belongs_to :days_to_ship

  VALID_PRICEL_HALF =                 /\A[0-9]+\z/

  with_options presence: true do
    validates :name
    validates :description
    validates :image
  end

  validates  :price,  presence: true, format: {with: VALID_PRICEL_HALF},length: {minimum: 3, maxinum: 7},numericality: { only_integer: true,
    greater_than: 300, less_than: 10000000
    }

  validates :product_condition_id, numericality: { other_than: 1 }
  validates :shipping_charges_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 0 }
  validates :days_to_ship_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }

  belongs_to :user
  # has_one :purchase_record
  has_one_attached :image
end
