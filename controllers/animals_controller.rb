require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
require( 'pry' )

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

get '/animals/:id' do
  @animal = Animal.find( params['id'] )
  @owner = @animal.get_owner()
  erb( :"animals/show" )
end

get '/animals/:id/edit' do
  @animal = Animal.find( params['id'] )
  @owner = @animal.get_owner()
  erb( :"animals/edit" )
end

post '/animals/:id' do
  animal = Animal.find( params[ 'id' ] )
  animal.update( params )
  redirect to "/animals"
end

get '/animals/:id/delete' do
  animal = Animal.find( params[ 'id' ] )
  animal.delete()
  redirect to "/animals"
end