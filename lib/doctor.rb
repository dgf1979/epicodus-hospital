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
    []
  end

end
