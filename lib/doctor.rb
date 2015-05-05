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
    returned_doctors = DB.exec("SELECT * FROM doctor")
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
    []
  end

end
