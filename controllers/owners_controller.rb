require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb' )
require_relative( '../models/match.rb' )

get '/owners' do
  @owners = Owner.find_all()
  erb( :"owners/index" )
end

get '/owners/new' do
  erb( :"owners/new" )
end

post '/owners' do
  owner = Owner.new( params )
  owner.save()
  redirect to "/owners"
end

get '/owners/:id' do
  @owner = Owner.find( params[ 'id' ] )
  @pets_owned = @owner.get_adopted_animals()
  erb( :"owners/show" )
end

get '/owners/:id/edit' do
  @owner = Owner.find( params[ 'id' ] )
  erb( :"owners/edit" )
end

post '/owners/:id' do
  owner = Owner.find( params['id'] )
  owner.update( params )
  redirect to "/owners"
end

get '/owners/:id/adopt' do
  @owner = Owner.find( params[ 'id' ] )
  @adoptable_animals = Animal.find_all_adoptable()
  erb( :"owners/adopt" )
end

post '/owners/:id/adopt' do
  owner = Owner.find( params[ 'id' ] )
  animal = Animal.find( params[ 'animal_id' ] )
  owner.adopt( animal )
  redirect to "/owners"
end

get '/owners/:id/unadopt' do
  @owner = Owner.find( params[ 'id' ] )
  @adopted_animals = @owner.get_adopted_animals()
  erb( :"owners/unadopt" )
end

post '/owners/:id/unadopt' do
  owner = Owner.find( params[ 'id' ] )
  animal = Animal.find( params[ 'animal_id' ] )
  owner.unadopt( animal)
  redirect to "/owners"
end

get '/owners/:id/delete' do
  owner = Owner.find( params[ 'id' ] )
  owner.delete()
  redirect to "/owners"
end

get '/owners/:id/match' do
  @owner = Owner.find( params[ 'id' ] )
  @adoptable_animals = Animal.find_all_adoptable()
  @results = Match.run_match( @owner, @adoptable_animals )
  erb( :"owners/match" )
end