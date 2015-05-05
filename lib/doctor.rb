class Doctor
  attr_reader(:id, :name, :specialty_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @specialty_id = attributes.fetch(:specialty_id)
  end

  define_method(:save) do
    sql = "INSERT INTO doctor (name, specialty_id)
    VALUES ('#{@name}',#{@specialty_id}) RETURNING id"
    result = DB.exec(sql)
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:all) do
    doctors = []
    returned_doctors = DB.exec("SELECT * FROM doctor ORDER BY name ASC")
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      specialty_id = doctor.fetch("specialty_id")
      id = doctor.fetch('id')
      doctors.push(Doctor.new({:name => name, :specialty_id => specialty_id, :id => id}))
    end
    doctors
  end

  define_singleton_method(:find) do |id|
    sql = "SELECT * FROM doctor WHERE id = #{id}"
    doctor = DB.exec(sql).first()
    name = doctor.fetch("name")
    specialty_id = doctor.fetch("specialty_id")
    id = doctor.fetch('id')
    Doctor.new({:name => name, :specialty_id => specialty_id, :id => id})
  end

  define_method(:all_patients) do
    patients = []
    sql = "SELECT * FROM patient WHERE doctor_id = #{@id}"
    returned_patients = DB.exec(sql)
    returned_patients.each() do |patient|
      name = patient.fetch("name")
      birthdate = patient.fetch("birthdate")
      doctor_id = patient.fetch("doctor_id")
      patients.push(Patient.new(:name => name, :birthdate => birthdate, :doctor_id => doctor_id))
    end
    patients
  end

  define_singleton_method(:all_by_specialty) do |specialty_id|
    specialty_doctors = []
    sql = "SELECT * FROM doctor WHERE specialty_id = #{specialty_id}"
    returned_doctors = DB.exec(sql)
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      specialty_id = doctor.fetch("specialty_id")
      id = doctor.fetch('id')
      specialty_doctors.push(Doctor.new({:name => name, :specialty_id => specialty_id, :id => id}))
    end
    specialty_doctors
  end

end
