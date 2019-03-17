class PatientsController < ApplicationController
  def index
    load_resources
  end

  def show
    load_resource
  end

  private

  def resources_scope
    @q = Patient.ransack(params[:q])
    @q.result
  end

  def load_resources
    split_full_name if params[:q].present? and params[:q][:first_name_or_last_name_in].present?
    @result ||= pagy(resources_scope, items: 20)
    @pagy = @result[0]
    @resources = @result[1]
  end

  def load_resource
    @resource ||= resources_scope.find(params[:id])
  end

  def split_full_name
    params[:q][:first_name_or_last_name_in] = params[:q][:first_name_or_last_name_in].split(' ')
  end
end
