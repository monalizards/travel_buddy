class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.references :trip, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
