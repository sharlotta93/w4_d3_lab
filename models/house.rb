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



end
