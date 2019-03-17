class Admission < ApplicationRecord
  has_and_belongs_to_many :diagnoses
  has_and_belongs_to_many :symptoms
  has_and_belongs_to_many :observations

  def date
    moment.to_date
  end

  def time
    moment.strftime('%H:%M')
  end

  def diagnoses_to_s
    diagnoses.map{|diagnosis| diagnosis.full_diagnosis}.join(', ')
  end

  def symptoms_to_s
    symptoms.pluck(:description).join(', ')
  end

  def observations_to_s
    observations.pluck(:description).join(', ')
  end

end
