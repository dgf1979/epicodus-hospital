require('sinatra')
require('sinatra/reloader')
require('./lib/doctor')
require('./lib/patient')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => 'hospital'})

get('/') do
  erb(:new_doctor_form)
end

#list all doctors alphabetically & with patient counts
get('/doctors') do
  @doctors = Doctor.all()
  erb(:doctors)
end

#add a new doctor (form)
get('/doctors/new') do
  erb(:new_doctor_form)
end

#add a new doctor (post)
post('/doctor/new') do
  name = params.fetch('name')
  specialty_id = params.fetch('specialty')
  new_doctor = Doctor.new({ :name => name, :specialty_id => specialty_id, :id => nil})
  new_doctor.save()
  @doctors = Doctor.all()
  erb(:doctors)
end


#add a new patient
get('/patients/new') do
  erb(:new_patient_form)
end

#view a patient details
get('/patients/:id') do
  erb(:patient_details)
end

#view a doctor's details
get('/doctors/:id') do
  erb(:doctor_details)
end

#list all doctors with a given specialty
get('/doctors/:specialty') do
  erb(:doctors_by_specialty)
end
