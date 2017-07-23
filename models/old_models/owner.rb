require( '../db/sql_runner.rb' )

class Owner

  attr_reader :id, :name

  def initialize( params )
    @id = params[ 'id' ].to_i() if params[ 'id' ]
    @name = params[ 'name' ]
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
    @name = params[ 'name' ] if params[ 'name' ]
    sql = "UPDATE owners 
          SET ( name ) = ( $1 )
          WHERE id = $2;"
    values = [ @name, @id ]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM owners
          WHERE id = $1;"
    values = [ @id ]
    SqlRunner.run( sql, values )
  end

  def self.find( search_id )
    sql = "SELECT * FROM owners 
          WHERE id = $1;"
    values = [ search_id ]
    return self.map_items( sql, values ).first()
  end

  def self.find_all()
    sql = "SELECT * FROM owners;"
    owners = self.map_items( sql )
    return owners
  end

  def self.map_items( sql, values = [] )
    results = SqlRunner.run( sql, values )
    owners = results.map { |owner| Owner.new( owner ) }
    return owners
  end



end