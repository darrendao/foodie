class CreateEstablishments < ActiveRecord::Migration
  def change
    create_table :establishments do |t|
      t.string :name
      t.string :website
      t.string :address
      t.string :telephone

      t.timestamps
    end
  end
end
