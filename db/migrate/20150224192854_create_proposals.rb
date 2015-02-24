class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :title
      t.text :public_description
      t.text :private_description
      t.belongs_to :event_section, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :proposals, :event_sections
    add_foreign_key :proposals, :users
  end
end
