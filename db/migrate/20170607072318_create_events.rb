class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date, index: true
      t.string :title, null: false
      t.text :summary, limit: 128, null: false
      t.string :image_url
      t.timestamps null: false
    end
  end
end
