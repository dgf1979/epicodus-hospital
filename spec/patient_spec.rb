require('spec_helper')

describe(Patient) do
  #As an administrator, I want to add a patient with their name and birthdate.
  describe('#id') do
    it('adds a patient') do
      new_patient = Patient.new({ :name => 'Drew', :birthdate => '1979-09-30'})
      new_patient.save()
      expect(new_patient.id()).to(be_an_instance_of(Fixnum))
      expect(new_patient.name()).to(eq('Drew'))
      expect(new_patient.birthdate()).to(eq('1979-09-30'))
    end
  end
end
