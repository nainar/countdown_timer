class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.date :calendar_entry

      t.timestamps null: false
    end
  end
end
