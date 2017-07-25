require_relative( '../db/sql_runner.rb' )
require_relative( './boolean_handler.rb')
require( 'date' )

class Animal

  @@accepted_keys = [ 'id', 'name', 'description', 'age', 'species', 'breed', 'picture_url', 'adoptable', 'admission_date', 'adoption_date', 'owner_id' ]

  attr_reader :id, :name, :description, :age, :species, :breed, :picture_url,
              :adoptable, :admission_date, :adoption_date, :owner_id

  def initialize( params )
    purged = Animal.purge_keys( params )
    checked = Animal.check_values( purged )
    checked.each() do | key, value |
      instance_variable_set( "@#{key}", value )
    end
  end

  def save()
    sql = "INSERT INTO animals
          ( name, description, age, species, breed, picture_url, adoptable, admission_date)
          VALUES ( $1, $2, $3, $4, $5, $6, $7, $8 ) 
          RETURNING id;"
    values = [ @name, @description, @age, @species, @breed, @picture_url, @adoptable, @admission_date ]
    result = SqlRunner.run( sql, values )
    @id = result.first()[ 'id' ].to_i()
  end

  def update( params )
    purged = Animal.purge_keys( params )
    checked = Animal.check_values( purged )
    checked.each() do | key, value |
      instance_variable_set( "@#{key}", value )
    end
    sql = "UPDATE animals SET
          ( name, description, age, species, breed, picture_url, adoptable, admission_date, adoption_date, owner_id) =
          ( $1, $2, $3, $4, $5, $6, $7, $8, $9, $10 )
          WHERE id = $11;"
    values = [ @name, @description, @age, @species, @breed, @picture_url, @adoptable, @admission_date, @adoption_date, @owner_id, @id ]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM animals
          WHERE id = $1;"
    values = [ @id ]
    SqlRunner.run( sql, values )
  end

  def set_adopted_by( owner )
    if @adoptable == true
      params = { 
        'adoptable' => false,
        'adoption_date' => Date.today(),
        'owner_id' => owner.id()
      }
      update( params )
    else
      raise "#{@name} is not adoptable."
    end
  end

  def unset_adopted_by( owner )
    if @adoption_date != nil
      params = {
        'adoptable' => true,
        'adoption_date' => nil,
        'owner_id' => nil
      }
      update( params )
    else
      raise "#{@name} is not currently adopted."
    end
  end

  def get_owner()
    sql = "SELECT * FROM owners
          WHERE id = $1;"
    values = [ @owner_id ]
    owner = Owner.map_items( sql, values ).first()
    return owner
  end

  def get_answers()
    sql = "SELECT * FROM answers
          WHERE animal_id = $1 ORDER BY id ASC;"
    values = [ @id ]
    answers = Answer.map_items( sql, values )
    return answers
  end

  #####################################################################

  def self.purge_keys( params )
    params.each do | key, value |
      params.delete( key ) if !@@accepted_keys.include?( key )
    end
    return params
  end

  def self.check_values( params )
    params[ 'id' ] = params[ 'id' ].to_i() if params[ 'id' ]
    params[ 'age' ] = params[ 'age' ].to_i() if params[ 'age' ]
    params[ 'adoptable' ] = BooleanHandler.convert( params[ 'adoptable' ] ) if params[ 'adoptable' ]
    params[ 'admission_date' ] = Date.parse( params[ 'admission_date' ] ) if ( params[ 'admission_date' ].class() != Date ) && ( params[ 'admission_date' ].class() != NilClass )
    params[ 'adoption_date' ] = Date.parse( params[ 'adoption_date' ] ) if ( params[ 'adoption_date' ].class() != Date ) && ( params[ 'adoption_date' ].class() != NilClass )
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
    sql = "SELECT * FROM animals ORDER BY id ASC;"
    animals = self.map_items( sql )
    return animals
  end

  def self.find_all_adoptable()
    sql = "SELECT * FROM animals
          WHERE adoptable = 't' ORDER BY id ASC;"
    animals = self.map_items( sql )
    return animals
  end

  def self.map_items( sql, values = [] )
    results = SqlRunner.run( sql, values )
    animals = results.map { |animal| Animal.new( animal ) }
    return animals
  end

end



