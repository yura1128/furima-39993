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

has_many :items
has_many :purchase_records


items

|product_name               |string     |null: false                            |
|product_description        |string     |null: false                            |
|price                      |integer    |null: false                            |
|user                       |references |null: false, foreign_key: true         |
|category_id                |integer    |null: false                            |
|item_condition_id          |integer    |null: false                            |
|shipping_fee_id            |integer    |null: false                            |
|shipping_area_id           |integer    |null: false                            |
|estimated_shipping_date_id |integer    |null: false                            |

belongs_to :users
has_one :purchase_record


purchase_records

|user                           |references |null: false, foreign_key: true    |
|item                           |references |null: false, foreign_key: true    |

belongs to:user
belongs to:item_information
has_one:shipping_addres


shipping_address

|postal_code                |string     |null: false                            |
|shipping_area_id           |integer    |null: false                            |
|city                       |string     |null: false                            |
|street                     |string     |null: false                            |
|building_name              |string     |                                       |
|phone_number               |string     |null: false                            |
|purchase_record            |references |null: false, foreign_key: true         |

belongs to:purchase_record