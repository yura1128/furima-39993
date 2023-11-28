class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :product_name,               null: false
      t.string     :product_description,        null: false
      t.integer    :price,                      null: false
      t.references :user,                       null: false, foreign_key: true
      t.integer    :category_id,                null: false
      t.integer    :item_condition_id,          null: false
      t.integer    :shipping_fee_id,            null: false
      t.integer    :shipping_area_id,           null: false
      t.integer    :estimated_shipping_date_id, null: false

      t.timestamps
    end
  end
end
