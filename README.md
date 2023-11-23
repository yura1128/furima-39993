# README


Users
|Column                  |Type       |Options                   |
|------------------------|-----------|--------------------------|
|nickname                |string     |null: false               |
|email                   |string     |null: false, unique: true |
|password                |string     |null: false               |
|firstname_kanji         |string     |null: false               |
|lastname_kanji          |string     |null: false               |
|firstname_kana          |string     |null: false               |
|lastname_kana           |string     |null: false               |
|birth_year              |integer    |null: false               |
|birth_month             |integer    |null: false               |
|birth_day               |integer    |null: false               |

has_many :Item_information
has_many :Purchase_records
has_many :Shipping_address_information


Item_information

|product_name            |string     |null: false               |
|seller_id               |references |foreign_key: true         |
|category                |string     |null: false               |
|item_condition          |string     |null: false               |
|shipping_fee            |string     |null: false               |
|shipping_area           |string     |null: false               |
|estimated_shipping_date |references |foreign_key: true         |

belongs_to :Users
has_many :Purchase_records
has_many :Shipping_address_information


Purchase_records

|card_info               |string     |null: false               |
|expiration_date         |string     |null: false               |
|security_code           |string     |null: false               |

belongs to:Users
belongs to:Item_information
belongs to:Shipping_address_information


Shipping_address_information

|postal_code             |string     |null: false               |
|prefecture              |string     |null: false               |
|city                    |string     |null: false               |
|street                  |string     |null: false               |
|building_name           |string     |                          |
|phone_number            |string     |null: false               |

belongs to:Users
belongs to:Item_information
belongs to:Purchase_records