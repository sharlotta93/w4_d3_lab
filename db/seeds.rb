require_relative('../models/students.rb')
require_relative('../models/house.rb')

house1 = House.new({
  "name" => "Griffindor"
  })

house2 = House.new({
  "name" => "Ravenclaw"
  })

house3 = House.new({
  "name" => "Slytherin"
  })

house4 = House.new({
  "name" => "Hufflepuff"
  })

house1.save()
house2.save()
house3.save()
house4.save()


student1 = Student.new({
  "name" => "Harry Potter",
  "house" => house1.id,
  "age" => 17
  })

student2 = Student.new({
  "name" => "Aaron McFaull",
  "house" => house3.id,
  "age" => 18
  })

student3 = Student.new({
  "name" => "Pauline Rudge",
  "house" => house2.id,
  "age" => 21
  })

  student1.save()
  student2.save()
  student3.save()
