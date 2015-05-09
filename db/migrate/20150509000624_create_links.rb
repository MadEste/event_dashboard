class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :label
      t.string :url
      t.belongs_to :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
