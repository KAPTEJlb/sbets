class Diagnosis < ApplicationRecord
  def full_diagnosis
    "#{description} (#{coding_system}:#{code})"
  end
end
