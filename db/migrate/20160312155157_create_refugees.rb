class CreateRefugees < ActiveRecord::Migration
  def change
    create_table :refugees do |t|
      t.string :first_name
      t.string :phone_number
      t.string :locale

      t.timestamps null: false
    end
  end
end
