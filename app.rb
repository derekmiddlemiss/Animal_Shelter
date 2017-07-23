require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative( './controllers/animals_controller.rb' )
require_relative( './controllers/owners_controller.rb' )

get '/' do
  erb( :index )
end

