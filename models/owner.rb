require_relative( '../db/sql_runner.rb' )

class Owner

  @@accepted_keys = [ 'id', 'name' ]

  attr_reader :id, :name

  def initialize( params )
    purged = Owner.purge_keys( params )
    checked = Owner.check_values( purged )
    checked.each() do | key, value |
      instance_variable_set( "@#{key}", value )
    end
  end

  def save()
    sql = "INSERT INTO owners 
          ( name ) VALUES ( $1 )
          RETURNING id;"
    values = [ @name ]
    result = SqlRunner.run( sql, values )
    @id = result.first()[ 'id' ].to_i()
  end

  def update( params )
    purged = Owner.purge_keys( params )
    checked = Owner.check_values( purged )
    checked.each() do | key, value |
      instance_variable_set( "@#{key}", value )
    end
    sql = "UPDATE owners 
          SET ( name ) = ( $1 )
          WHERE id = $2;"
    values = [ @name, @id ]
    SqlRunner.run( sql, values )
  end

  def delete()
    adopted_animals = self.get_adopted_animals()
    for animal in adopted_animals
      self.unadopt( animal )
    end
    sql = "DELETE FROM owners
          WHERE id = $1;"
    values = [ @id ]
    SqlRunner.run( sql, values )
  end

  def adopt( animal )
    animal.set_adopted_by( self )
  end

  def unadopt( animal )
    animal.unset_adopted_by( self )
  end

  def get_adopted_animals()
    sql = "SELECT * FROM animals 
          WHERE owner_id = $1 ORDER BY id ASC;"
    values = [ @id ]
    return Animal.map_items( sql, values)
  end

  def get_answers()
    sql = "SELECT * FROM answers
          WHERE owner_id = $1 ORDER BY id ASC;"
    values = [ @id ]
    answers = Answer.map_items( sql, values )
    return answers
  end

  def get_answer( question_id )
    sql = "SELECT * FROM answers
          WHERE owner_id = $1 
          AND question_id = $2;"
    values = [ @id, question_id ]
    answer = Answer.map_items( sql, values ).first()
    return answer
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
    return params
  end

  def self.find( search_id )
    sql = "SELECT * FROM owners 
          WHERE id = $1;"
    values = [ search_id ]
    return self.map_items( sql, values ).first()
  end

  def self.find_all()
    sql = "SELECT * FROM owners ORDER BY id ASC;"
    owners = self.map_items( sql )
    return owners
  end

  def self.map_items( sql, values = [] )
    results = SqlRunner.run( sql, values )
    owners = results.map { |owner| Owner.new( owner ) }
    return owners
  end



end