class CreateJoinTableAdmissionSymptom < ActiveRecord::Migration[5.2]
  def change
    create_join_table :admissions, :symptoms do |t|
      t.index [:admission_id, :symptom_id]
      t.index [:symptom_id, :admission_id]
    end
  end
end
