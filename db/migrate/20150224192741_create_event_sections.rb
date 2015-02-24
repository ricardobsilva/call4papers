class CreateEventSections < ActiveRecord::Migration
  def change
    create_table :event_sections do |t|
      t.string :name
      t.text :description
      t.belongs_to :event

      t.timestamps null: false
    end
    add_foreign_key :event_sections, :events
  end
end
