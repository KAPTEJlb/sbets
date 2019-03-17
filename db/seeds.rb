# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def populate_db
  5.times do
    Facility.create(name: Faker::Company.name)
  end

  10.times do
    Allergy.create(description: [Faker::Food.fruits, Faker::Food.vegetables].sample.downcase)
  end

  20.times do
    Symptom.create(description: "#{Faker::Color.color_name} #{Faker::Lorem.words(1)[0]} #{Faker::Games::Pokemon.name}".downcase)
  end

  20.times do
    Observation.create(
        description: "#{Faker::Color.color_name} #{Faker::Lorem.words(1)[0]} #{Faker::Games::Pokemon.name}".downcase,
        moment: Time.now-rand(1..30).days-rand(1..10).hours
    )
  end

  10.times do
    Treatment.create(description: Faker::Lorem.words(1)[0], necessity: Faker::Lorem.words(1)[0])
  end

  20.times do
    OrderFrequency.create(value: rand(1..72), unit: 0)
  end



  30.times do
    MedicationOrder.create(
        name: Faker::Cannabis.cannabinoid,
        unit: 0,
        dosage: rand(10..1000),
        route: rand(0..2),
        frequency_id: OrderFrequency.pluck(:id).sample,
        necessity: Faker::Cannabis.health_benefit
    )
  end

  30.times do
    Diagnosis.create(
        coding_system: "S#{rand(10..99)}",
        code: rand(1..999),
        description: Faker::Lorem.sentence(3, true)
    )
  end

  100.times do
    admission = Admission.create(
        moment: Time.now-rand(1..30).days-rand(1..10).hours,
        diagnoses: Diagnosis.all.to_a.sample(rand(1..3)),
        symptoms: Symptom.all.to_a.sample(rand(1..3)),
        observations: Observation.all.to_a.sample(rand(1..3))
    )
    Patient.create(
        first_name: Faker::Name.first_name,
        middle_name: [Faker::Name.middle_name, ''].sample,
        last_name: Faker::Name.last_name,
        dob: Date.today-rand(5..60).years-rand(1..364).days,
        mr: rand(100000..400000),
        gender: rand(0..2),
        admission: admission,
        allergies: Allergy.all.to_a.sample(rand(1..3)),
        chronic_conditions: Diagnosis.all.to_a.sample(rand(0..3)),
        medications: MedicationOrder.all.to_a.sample(rand(1..3)),
        diagnoses: Diagnosis.all.to_a.sample(rand(1..3)),
        treatments: Treatment.all.to_a.sample(rand(1..3)),
        facility: Facility.all.to_a.sample
    )



  end
end

populate_db