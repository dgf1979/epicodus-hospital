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

end
