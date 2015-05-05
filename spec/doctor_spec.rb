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

  describe('.all') do
    it('returns a list of all saved doctors') do
      new_doctor = Doctor.new({:name => 'Doogy Houser', :specialty_id => 1, :id => nil})
      new_doctor.save()
      new_doctor = Doctor.new({:name => 'House', :specialty_id => 2, :id => nil})
      new_doctor.save()
      expect(Doctor.all().length).to(eq(2))
    end
  end
end
