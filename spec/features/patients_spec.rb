require 'rails_helper'
require 'faker'
require 'database_cleaner'

RSpec.describe 'Patients page' do
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean

  let(:facility) {Facility.first}
  let(:patient) {facility.patients.first}
  let(:admission) {patient.admission}

  before :each do
    visit patients_path
  end

  context 'Populated Patients list page' do
    it 'main page' do
      populate_db
      visit '/'
      expect(page).to have_text 'KIPU Challenge by Andriy Kondzolko'
      click_link 'Please Click Here To Start'
    end

    it 'have content' do
      expect(page).to have_text facility.name
      expect(page).to have_text patient.full_name
      expect(page).to have_text patient.gender
      expect(page).to have_text admission.diagnoses_to_s
      expect(page).to have_text admission.symptoms_to_s
    end

    it 'filter' do

      patient_last = facility.patients.last

      select facility.name, from: 'q_facility_id_eq'
      click_button 'Search'
      expect(page).to have_text patient.full_name
      expect(page).to have_text facility.patients.first.full_name

      find('#q_first_name_or_last_name_in').set(patient.full_name)
      expect(page).to have_text patient.full_name
      expect(page).to have_text patient.gender
      click_button 'Search'
      expect(page).to have_text patient.full_name
      expect(page).to_not have_text patient_last.full_name
      click_link 'Clear Filters'

      find('#q_admission_diagnoses_description_start').set(admission.diagnoses_to_s.gsub(/\(.*/, '').strip)
      click_button 'Search'
      expect(page).to have_text admission.diagnoses_to_s
      expect(page).to_not have_text patient_last.admission.diagnoses_to_s
      click_link 'Clear Filters'

      find('#q_admission_symptoms_description_start').set(admission.symptoms.first.description)
      click_button 'Search'
      expect(page).to have_text admission.symptoms.last.description
      click_link 'Clear Filters'

      expect(page).to have_text patient_last.admission.symptoms.last.description
    end
  end


  context 'Patients list page is empty' do
    it 'not have content' do
      DatabaseCleaner.clean
      visit patients_path
      expect(page).to have_text 'Patients list is empty!'
    end
  end

  context 'Patients show page' do
    it 'first patient show page' do
      click_link patient.full_name
      expect(page).to have_text "This #{patient.age} years old #{patient.gender} was admitted to #{patient.facility_name} on #{patient.admission.date} at #{patient.admission.time} due to #{patient.admission.diagnoses_to_s}. The observed symptoms on admission were #{patient.admission.symptoms_to_s}. #{patient.admission.observations_to_s}."
      expect(page).to have_text "Upon asking about known allergies, the patient disclosed #{patient.allergies_to_s}. Upon asking about chronic conditions, the patient disclosed #{patient.chronic_conditions_to_s}. The patient was administered with #{patient.medications_to_s}."
      expect(page).to have_text "The staff performed #{patient.diagnostic_procedures_to_s}, revealing #{patient.diagnoses_to_s}. Our team proceeded to #{patient.treatments_to_s}."
    end
  end
end