class CreateJoinTableMedicationOrderPatient < ActiveRecord::Migration[5.2]
  def change
    create_join_table :medication_orders, :patients do |t|
      t.index [:medication_order_id, :patient_id], name: 'mop'
      t.index [:patient_id, :medication_order_id], name: 'pmo'
    end
  end
end
