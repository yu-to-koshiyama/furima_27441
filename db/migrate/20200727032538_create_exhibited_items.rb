class CreateExhibitedItems < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibited_items do |t|

      t.timestamps
    end
  end
end
