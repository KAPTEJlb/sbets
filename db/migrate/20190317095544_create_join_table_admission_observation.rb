class CreateJoinTableAdmissionObservation < ActiveRecord::Migration[5.2]
  def change
    create_join_table :admissions, :observations do |t|
      t.index [:admission_id, :observation_id], name: 'ao'
      t.index [:observation_id, :admission_id], name: 'oa'
    end
  end
end
