class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :destination
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :budget
      t.integer :max_participants
      t.references :organizer, index: true, foreign_key: { to_table: :users }


      t.timestamps
    end
  end
end
