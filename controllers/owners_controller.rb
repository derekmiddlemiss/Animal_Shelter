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