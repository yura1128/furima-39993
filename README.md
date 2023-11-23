# README


users
|Column                     |Type       |Options                                |
|---------------------------|-----------|---------------------------------------|
|nickname                   |string     |null: false                            |
|email                      |string     |null: false, unique: true              |
|encrypted_password         |string     |null: false                            |
|firstname_kanji            |string     |null: false                            |
|lastname_kanji             |string     |null: false                            |
|firstname_kana             |string     |null: false                            |
|lastname_kana              |string     |null: false                            |
|birthday                   |date       |null: false                            |

has_many :items_information
has_many :purchase_records


items_information

|product_name               |string     |null: false                            |
|product_description        |string     |null: false                            |
|price                      |integer    |null: false                            |
|user_id                    |integer    |null: false                            |
|category_id                |integer    |null: false                            |
|item_condition_id          |integer    |null: false                            |
|shipping_fee_id            |integer    |null: false                            |
|shipping_area_id           |integer    |null: false                            |
|estimated_shipping_date_id |integer    |foreign_key: true                      |

belongs_to :users
has_many :purchase_records


purchase_records

|user_id                        |string     |null: false                       |
|items_information_id           |string     |null: false                       |

belongs to:user
belongs to:item_information
belongs to:shipping_addres_information


shipping_address_information

|postal_code                |string     |null: false                            |
|shipping_area_id           |integer    |null: false                            |
|city                       |string     |null: false                            |
|street                     |string     |null: false                            |
|building_name              |string     |                                       |
|phone_number               |string     |null: false                            |

belongs to:Purchase_record