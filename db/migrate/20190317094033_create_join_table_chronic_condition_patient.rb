class CreateJoinTableChronicConditionPatient < ActiveRecord::Migration[5.2]
  def change
    create_join_table :chronic_conditions, :patients do |t|
      t.index [:chronic_condition_id, :patient_id], name: 'ccp'
      t.index [:patient_id, :chronic_condition_id], name: 'pcc'
    end
  end
end
