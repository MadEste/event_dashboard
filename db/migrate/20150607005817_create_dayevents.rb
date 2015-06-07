class CreateDayevents < ActiveRecord::Migration
  def change
    create_table :dayevents do |t|
      t.references :day, index: true, foreign_key: true
      t.string :title
      t.time :start
      t.time :stop
      t.text :description

      t.timestamps null: false
    end
  end
end
