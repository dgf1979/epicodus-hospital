require('spec_helper')

describe(Doctor) do
  #As an administrator, I want to add a doctor to the database with a name and specialty.
  describe('#initialize') do
    it("returns the id, name, and specialty of the doctor") do
      new_doctor = Doctor.new({:name => 'Doogy Houser', :specialty_id => 1, :id => nil})
      new_doctor.save()
      expect(new_doctor.name()).to(eq('Doogy Houser'))
      expect(new_doctor.id()).to(be_an_instance_of(Fixnum))
      expect(new_doctor.specialty_id()).to(eq(1))
    end
  end

  describe('.all') do
    it('returns a list of all saved doctors') do
      new_doctor = Doctor.new({:name => 'Doogy Houser', :specialty_id => 1, :id => nil})
      new_doctor.save()
      new_doctor = Doctor.new({:name => 'House', :specialty_id => 2, :id => nil})
      new_doctor.save()
      expect(Doctor.all().length).to(eq(2))
    end
  end

  describe('.find') do
    it('returns a doctor with the specific id') do
      new_doctor = Doctor.new({:name => 'Doogy Houser', :specialty_id => 1, :id => nil})
      new_doctor.save()
      new_doctor2 = Doctor.new({:name => 'House', :specialty_id => 2, :id => nil})
      new_doctor2.save()
      doctor2_id = new_doctor2.id()
      expect(Doctor.find(doctor2_id).name()).to( eq( new_doctor2.name() ) )
    end
  end

  #As a doctor, I want to see the list of patients that have been assigned to me.
  describe('#all_patients') do
    it('return all patients assigned to this doctor') do
      #add doctor
      new_doctor = Doctor.new({:name => 'Doogy Houser', :specialty_id => 1, :id => nil})
      new_doctor.save()
      #patient 1
      new_patient = Patient.new({ :name => 'Drew', :birthdate => '1979-09-30', :doctor_id => nil})
      new_patient.save()
      new_patient.assign_doctor(new_doctor.id())
      #patient 2
      new_patient = Patient.new({ :name => 'Bob', :birthdate => '1955-09-30', :doctor_id => nil})
      new_patient.save()
      new_patient.assign_doctor(new_doctor.id())
      expect(new_doctor.all_patients().length).to(eq(2))
    end
  end

  #As a patient, I want to see a list of all the doctors in a particular specialty.
  #A doctor will only have one specialty.
  describe('.all_by_specialty') do
    it('return all doctors having the given specialty id') do
      #add doctor
      new_doctor = Doctor.new({:name => 'Doogy Houser', :specialty_id => 1, :id => nil})
      new_doctor.save()
      #add doctor
      new_doctor = Doctor.new({:name => 'House', :specialty_id => 2, :id => nil})
      new_doctor.save()
      #add doctor
      new_doctor = Doctor.new({:name => 'Strangelove', :specialty_id => 1, :id => nil})
      new_doctor.save()
      expect(Doctor.all_by_specialty(1).length).to(eq(2))
    end
  end
end
