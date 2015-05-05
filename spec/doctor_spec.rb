require('spec_helper')

describe(Doctor) do
  describe('#initialize') do
    it("returns the id, name, and specialty of the doctor") do
      new_doctor = Doctor.new({:name => 'Doogy Houser', :specialty_id => 1, :id => nil})
      new_doctor.save()
      expect(new_doctor.name()).to(eq('Doogy Houser'))
      expect(new_doctor.id()).to(be_an_instance_of(Fixnum))
      expect(new_doctor.specialty_id()).to(eq(1))
    end
  end
end
