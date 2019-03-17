class DiagnosticProcedure < ApplicationRecord

  def date
    moment.to_date
  end

  def time
    moment.strftime('%H:%M')
  end

  def full_diagnostic_procedure
    "#{description} on #{date} at #{time}"
  end
end
