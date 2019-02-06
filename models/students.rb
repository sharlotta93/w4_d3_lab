require_relative('../db/sql_runner')

class Student

  attr_reader :name, :house, :age, :id

  def initialize(person)
    @id = person['id'].to_i if person['id']
    @name = person['name']
    @house = person['house']
    @age = person['age']
  end

  def save()
    sql = "INSERT INTO students
    ( name, house, age)
    VALUES
    ($1, $2, $3)
    RETURNING *"
    values = [@name, @house, @age]
    result = SqlRunner.run(sql, values)
    @id = result.first()['id'].to_i
  end

  def update()
    sql = "UPDATE students
    SET
    (name, house, age) =
    ($1, $2, $3)
    WHERE id = $4"
    values = [@name, @house, @age, @id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run( sql )
    result = students.map { |person| Student.new( person ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM students
    WHERE id = $1"
    values = [id]
    student = SqlRunner.run( sql, values )
    result = Student.new( student.first )
    return result
  end


end
