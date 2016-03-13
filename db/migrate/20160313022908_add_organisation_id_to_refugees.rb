class AddOrganisationIdToRefugees < ActiveRecord::Migration
  def change
    add_column :refugees, :organisation_id, :integer
  end
end
