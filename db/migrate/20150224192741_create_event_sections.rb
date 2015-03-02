class CreateEventSections < ActiveRecord::Migration
  def change
    create_table :event_sections do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.belongs_to :event, index: true

      t.timestamps null: false
    end
    add_foreign_key :event_sections, :events
  end
end
