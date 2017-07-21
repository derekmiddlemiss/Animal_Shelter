require_relative( '../models/owner.rb' )
require( 'pry' )

long_john_silver = Owner.new( { 'name' => 'Long John Silver' } )
long_john_silver.save()

p long_john_silver