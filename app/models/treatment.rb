class Treatment < ApplicationRecord
  def full_treatment
    "#{description} to #{necessity}"
  end
end
