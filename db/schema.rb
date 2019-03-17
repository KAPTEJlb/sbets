# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_17_103707) do

  create_table "admissions", force: :cascade do |t|
    t.datetime "moment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admissions_diagnoses", id: false, force: :cascade do |t|
    t.integer "admission_id", null: false
    t.integer "diagnosis_id", null: false
    t.index ["admission_id", "diagnosis_id"], name: "index_admissions_diagnoses_on_admission_id_and_diagnosis_id"
    t.index ["diagnosis_id", "admission_id"], name: "index_admissions_diagnoses_on_diagnosis_id_and_admission_id"
  end

  create_table "admissions_observations", id: false, force: :cascade do |t|
    t.integer "admission_id", null: false
    t.integer "observation_id", null: false
    t.index ["admission_id", "observation_id"], name: "ao"
    t.index ["observation_id", "admission_id"], name: "oa"
  end

  create_table "admissions_symptoms", id: false, force: :cascade do |t|
    t.integer "admission_id", null: false
    t.integer "symptom_id", null: false
    t.index ["admission_id", "symptom_id"], name: "index_admissions_symptoms_on_admission_id_and_symptom_id"
    t.index ["symptom_id", "admission_id"], name: "index_admissions_symptoms_on_symptom_id_and_admission_id"
  end

  create_table "allergies", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "allergies_patients", id: false, force: :cascade do |t|
    t.integer "allergy_id", null: false
    t.integer "patient_id", null: false
    t.index ["allergy_id", "patient_id"], name: "index_allergies_patients_on_allergy_id_and_patient_id"
    t.index ["patient_id", "allergy_id"], name: "index_allergies_patients_on_patient_id_and_allergy_id"
  end

  create_table "chronic_conditions_patients", id: false, force: :cascade do |t|
    t.integer "chronic_condition_id", null: false
    t.integer "patient_id", null: false
    t.index ["chronic_condition_id", "patient_id"], name: "ccp"
    t.index ["patient_id", "chronic_condition_id"], name: "pcc"
  end

  create_table "diagnoses", force: :cascade do |t|
    t.string "coding_system"
    t.string "code"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagnoses_patients", id: false, force: :cascade do |t|
    t.integer "diagnosis_id", null: false
    t.integer "patient_id", null: false
    t.index ["diagnosis_id", "patient_id"], name: "index_diagnoses_patients_on_diagnosis_id_and_patient_id"
    t.index ["patient_id", "diagnosis_id"], name: "index_diagnoses_patients_on_patient_id_and_diagnosis_id"
  end

  create_table "diagnostic_procedures", force: :cascade do |t|
    t.text "description"
    t.datetime "moment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagnostic_procedures_patients", id: false, force: :cascade do |t|
    t.integer "diagnostic_procedure_id", null: false
    t.integer "patient_id", null: false
    t.index ["diagnostic_procedure_id", "patient_id"], name: "dpp"
    t.index ["patient_id", "diagnostic_procedure_id"], name: "pdp"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medication_orders", force: :cascade do |t|
    t.string "name"
    t.integer "unit"
    t.decimal "dosage"
    t.integer "route"
    t.integer "frequency_id"
    t.text "necessity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medication_orders_patients", id: false, force: :cascade do |t|
    t.integer "medication_order_id", null: false
    t.integer "patient_id", null: false
    t.index ["medication_order_id", "patient_id"], name: "mop"
    t.index ["patient_id", "medication_order_id"], name: "pmo"
  end

  create_table "observations", force: :cascade do |t|
    t.text "description"
    t.datetime "moment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_frequencies", force: :cascade do |t|
    t.string "value"
    t.integer "unit", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "mr"
    t.date "dob"
    t.integer "gender"
    t.integer "admission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "facility_id"
  end

  create_table "patients_treatments", id: false, force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "treatment_id", null: false
    t.index ["patient_id", "treatment_id"], name: "index_patients_treatments_on_patient_id_and_treatment_id"
    t.index ["treatment_id", "patient_id"], name: "index_patients_treatments_on_treatment_id_and_patient_id"
  end

  create_table "symptoms", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treatments", force: :cascade do |t|
    t.text "description"
    t.text "necessity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
