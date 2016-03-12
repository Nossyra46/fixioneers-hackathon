class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.string :password

      t.timestamps null: false
    end
  end
end
