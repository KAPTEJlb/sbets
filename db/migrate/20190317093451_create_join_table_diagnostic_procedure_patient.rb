class CreateJoinTableDiagnosticProcedurePatient < ActiveRecord::Migration[5.2]
  def change
    create_join_table :diagnostic_procedures, :patients do |t|
      t.index [:diagnostic_procedure_id, :patient_id], name: 'dpp'
      t.index [:patient_id, :diagnostic_procedure_id], name: 'pdp'
    end
  end
end
