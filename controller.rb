require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative( './models/students' )
require_relative( './models/house')
also_reload( './models/*' )

get '/students' do
  @students = Student.all()
  erb(:index)
end

get '/students/new' do
  @houses = House.all()
  erb(:new)
end

post '/students' do
  @student = Student.new(params)
  @student.save
  redirect to '/students'
end

get '/students/houses' do
  @houses = House.all()
  @students = House.find_students()
  erb(:houses)
end
