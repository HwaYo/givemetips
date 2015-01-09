class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text :content
      t.belongs_to :writer, index: true
      t.timestamps null: false
    end
  end
end
