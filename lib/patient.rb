class Patient
  attr_reader(:id, :name, :birthdate, :doctor_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @birthdate = attributes.fetch(:birthdate)
    @doctor_id = attributes.fetch(:doctor_id)
  end

  define_method(:save) do
    sql = "INSERT INTO patient (name, birthdate) VALUES ('#{@name}', '#{@birthdate}') RETURNING id"
    result = DB.exec(sql)
    @id = result.first().fetch("id").to_i()
  end

  define_method(:assign_doctor) do |doctor_id|
    sql = "UPDATE patient SET doctor_id = #{doctor_id} WHERE id = #{@id}"
    DB.exec(sql)
    @doctor_id = doctor_id
  end

  define_singleton_method(:all) do
    patients = []
    sql = "SELECT * FROM patient"
    returned_patients = DB.exec(sql)
    returned_patients.each() do |patient|
      name = patient.fetch("name")
      birthdate = patient.fetch("birthdate")
      doctor_id = patient.fetch("doctor_id")
      id = patient.fetch("id")
      patients.push(Patient.new({:name => name, :birthdate => birthdate, :doctor_id => doctor_id, :id => id}))
    end
    patients
  end
end
