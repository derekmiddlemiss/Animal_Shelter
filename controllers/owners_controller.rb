require_relative( '../models/owner.rb' )

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
  @pets_owned = @owner.adopted_animals()
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