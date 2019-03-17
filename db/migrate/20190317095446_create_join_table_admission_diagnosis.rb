class CreateJoinTableAdmissionDiagnosis < ActiveRecord::Migration[5.2]
  def change
    create_join_table :admissions, :diagnoses do |t|
      t.index [:admission_id, :diagnosis_id]
      t.index [:diagnosis_id, :admission_id]
    end
  end
end
