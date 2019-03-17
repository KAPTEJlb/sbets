class AddFacilityIdToPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :facility_id, :integer
  end
end
