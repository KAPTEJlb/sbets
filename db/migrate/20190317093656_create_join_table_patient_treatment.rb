class CreateJoinTablePatientTreatment < ActiveRecord::Migration[5.2]
  def change
    create_join_table :patients, :treatments do |t|
      t.index [:patient_id, :treatment_id]
      t.index [:treatment_id, :patient_id]
    end
  end
end
