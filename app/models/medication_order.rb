class MedicationOrder < ApplicationRecord

  enum unit: { mg: 0 }
  enum route: { PO: 0, IM: 1, SC: 2}

  belongs_to :order_frequency, class_name: 'OrderFrequency', foreign_key: :frequency_id

  def full_medication
    "#{name} #{dosage}mg #{route} q#{order_frequency.value}hr to #{necessity}"
  end

end