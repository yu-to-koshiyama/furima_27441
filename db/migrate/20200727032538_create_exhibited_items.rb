class CreateExhibitedItems < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibited_items do |t|

      t.string     :name,                 null: false      
      t.text       :explanation,          null: false      
      t.integer    :price,                null: false       
      t.integer    :category_id,          null: false       
      t.integer    :status_id,            null: false       
      t.integer    :payment_id,           null: false       
      t.integer    :prefecture_id,        null: false       
      t.integer    :until_delivery_id,    null: false       
      t.references :user,                 foreign_key: true
      t.timestamps
    end
  end
end
