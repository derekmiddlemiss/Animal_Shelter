require_relative( '../models/animal.rb' )

get '/animals' do
  @animals = Animal.find_all()
  erb( :"animals/index" )
end

get '/animals/new' do
  erb( :"animals/new")
end

post '/animals' do
  animal = Animal.new( params )
  animal.save()
  redirect to "/animals"
end