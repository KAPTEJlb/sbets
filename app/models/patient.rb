class Patient < ApplicationRecord

  enum gender: { male: 0, female: 1, other: 2 }

  has_and_belongs_to_many :allergies
  has_and_belongs_to_many :chronic_conditions,
                          class_name: 'Diagnosis',
                                     association_foreign_key: 'chronic_condition_id',
                                     join_table: 'chronic_conditions_patients'

  has_and_belongs_to_many :medications, class_name: 'MedicationOrder'
  has_and_belongs_to_many :diagnostic_procedures
  has_and_belongs_to_many :diagnoses
  has_and_belongs_to_many :treatments
  belongs_to :admission
  belongs_to :facility
  delegate :name, to: :facility, prefix: true

  def full_name
    [first_name.presence, middle_name.presence, last_name.presence].compact.join(' ')
  end

  def age
    ((Time.zone.now - dob.to_time)/ 1.year.seconds).floor
  end

  def allergies_to_s
    allergies.pluck(:description).join(', ').presence || 'no allergies'
  end

  def chronic_conditions_to_s
    chronic_conditions.map{|diagnosis| diagnosis.full_diagnosis}.join(', ').presence || 'no chronic conditions'
  end

  def medications_to_s
    medications.map{|medication| medication.full_medication}.join(', ').presence || 'no medications'
  end

  def diagnostic_procedures_to_s
    diagnostic_procedures.map{|procedure| procedure.full_diagnostic_procedure}.join(', ').presence || 'no diagnostic procedures'
  end

  def diagnoses_to_s
    diagnoses.map{|diagnosis| diagnosis.full_diagnosis}.join(', ').presence || 'no diagnoses'
  end

  def treatments_to_s
    treatments.map{|treatment| treatment.full_treatment}.join(', ').presence || 'no treatments'
  end

  default_scope { order(first_name: :asc) }
end
