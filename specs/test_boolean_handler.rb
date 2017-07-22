require_relative( '../models/boolean_handler.rb' )

input = "True"
p BooleanHandler.convert( input )

input = true
p BooleanHandler.convert( input )

input = false
p BooleanHandler.convert( input )

input = "Banana"
p BooleanHandler.convert( input )
