class Purchase
  include ActiveModel::Model

  # PurchaseRecord attributes
  attr_accessor :user_id, :item_id, :token, :postal_code, :shipping_area_id, :city, :street, :building_name, :phone_number

  # Other attributes related to your logic

  # Validations
  with_options presence: true do
    validates :user_id, :item_id, :token, :postal_code, :shipping_area_id, :city, :street, :phone_number
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :phone_number, numericality: { only_integer: true }
  end
  validates :phone_number, length: { minimum: 10, maximum: 11, message: "is invalid. Input only numbers" }, if: -> { phone_number.present? }
  validates :phone_number, format: { with: /\A\d+\z/, message: "is invalid. Input only numbers" }, if: -> { phone_number.present? }

  def purchase_record=(purchase_record)
    @purchase_record = purchase_record
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    
    # ShippingAddress の保存
    shipping_address = ShippingAddress.create(
      purchase_record_id: purchase_record.id,
      postal_code: postal_code,
      shipping_area_id: shipping_area_id,
      city: city,
      street: street,
      building_name: building_name,
      phone_number: phone_number
    )

  end
end