class FrontController < ApplicationController
  def index
    @patients = Patient.order(updated_at: :desc).limit(5)
  end
end
