class CreateDealings < ActiveRecord::Migration[6.0]
  def change
    create_table :dealings do |t|
      t.references :user,                 foreign_key: true
      t.references :exhibited_item,       foreign_key: true
      t.timestamps
    end
  end
end
