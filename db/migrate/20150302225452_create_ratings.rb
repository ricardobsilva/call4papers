class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.belongs_to :user, index: true
      t.belongs_to :proposal, index: true

      t.timestamps null: false
    end
    add_foreign_key :ratings, :users
    add_foreign_key :ratings, :proposals
  end
end
