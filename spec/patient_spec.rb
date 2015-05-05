require('spec_helper')

describe(Patient) do
  #As an administrator, I want to add a patient with their name and birthdate.
  describe('#id') do
    it('adds a patient') do
      new_patient = Patient.new({ :name => 'Drew', :birthdate => '1979-09-30', :doctor_id => nil})
      new_patient.save()
      expect(new_patient.id()).to(be_an_instance_of(Fixnum))
      expect(new_patient.name()).to(eq('Drew'))
      expect(new_patient.birthdate()).to(eq('1979-09-30'))
    end
  end

  describe('#assign_doctor') do
    it ("assigns a doctor id to a patient") do
      new_doctor = Doctor.new(:name => "Doctor", :specialty_id => 3, :id => nil)
      new_doctor.save()
      new_patient = Patient.new({ :name => 'Drew', :birthdate => '1979-09-30', :doctor_id => nil})
      new_patient.save()
      new_patient.assign_doctor(new_doctor.id())
      expect(new_patient.doctor_id()).to(eq(new_doctor.id()))
    end
  end

end
