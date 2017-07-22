require_relative( '../db/sql_runner.rb' )
require_relative( './boolean_handler.rb')
require( 'date' )
require( 'pry' )

class Animal

  attr_reader :id, :name, :description, :age, :species, :breed, 
              :adoptable, :admission_date, :adoption_date, :owner_id

  def initialize( params )
    binding.pry
    purged = Animal.purge_params_keys( params )
    checked = Animal.check_params_values( purged )
    checked.each() do | key, value |
      instance_variable_set( "@#{key}", value )
    end
  end

  def save()
    sql = "INSERT INTO animals
          ( name, description, age, species, breed, adoptable, admission_date)
          VALUES ( $1, $2, $3, $4, $5, $6, $7 ) 
          RETURNING id;"
    values = [ @name, @description, @age, @species, @breed, @adoptable, @admission_date ]
    result = SqlRunner.run( sql, values )
    @id = result.first()[ 'id' ].to_i()
  end

  def update()

  end

  def self.purge_params_keys( params )
    accepted_keys = [ 'id', 'name', 'description', 'age', 'species', 'breed', 'adoptable', 'admission_date', 'adoption_date', 'owner_id' ]
    params.each do | key, value |
      if !accepted_keys.include?( key )
        params.delete( key )
      end
    end
    return params
  end

  def self.check_params_values( params )
    params[ 'id' ] = params[ 'id' ].to_i() if params[ 'id' ]
    params[ 'age' ] = params[ 'age' ].to_i() if params[ 'age' ]
    params[ 'adoptable' ] = BooleanHandler.convert( params[ 'adoptable' ] )
    params[ 'admission_date' ] = ( params[ 'admission_date' ] ? Date.parse( params[ 'admission_date' ] ) : Date.today() )
    params[ 'adoption_date' ] = Date.parse( params[ 'adoption_date' ] ) if params[ 'adoption_date' ]
    params[ 'owner_id' ] = params[ 'owner_id' ].to_i() if params[ 'owner_id' ]
    return params
  end

  def self.find( search_id )
    sql = "SELECT * FROM animals 
          WHERE id = $1;"
    values = [ search_id ]
    return self.map_items( sql, values ).first()
  end
  
  def self.find_all()
    sql = "SELECT * FROM animals"
    animals = self.map_items( sql )
    return animals
  end

  def self.map_items( sql, values = [] )
    results = SqlRunner.run( sql, values )
    animals = results.map { |animal| Animal.new( animal ) }
    return animals
  end

end



