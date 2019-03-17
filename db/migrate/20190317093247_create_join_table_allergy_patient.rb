class CreateJoinTableAllergyPatient < ActiveRecord::Migration[5.2]
  def change
    create_join_table :allergies, :patients do |t|
      t.index [:allergy_id, :patient_id]
      t.index [:patient_id, :allergy_id]
    end
  end
end
