require_relative('../db/sql_runner')

class House

 attr_reader :name, :id

  def initialize(house)
    @id = house['id'].to_i if house['id']
    @name = house['name']
  end

  def save()
    sql = "INSERT INTO houses
    (name) VALUES ($1)
    RETURNING *"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run( sql )
    result = houses.map { |house| House.new( house ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM houses
    WHERE id = $1"
    values = [id]
    house = SqlRunner.run( sql, values )
    result = House.new( house.first )
    return result
  end



end
