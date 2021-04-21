class PurchaseRecordDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :building_name
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :user_id
    validates :item_id
    validates :token
  end
    validates :shipping_area_id, numericality: { other_than: 1 }

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end