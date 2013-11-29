class CreateLenses < ActiveRecord::Migration
  def change
    create_table :lenses do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
