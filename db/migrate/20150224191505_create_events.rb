class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.date :date
      t.string :url
      t.string :logo
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :events, :users
  end
end
