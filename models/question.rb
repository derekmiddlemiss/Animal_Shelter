require_relative( '../db/sql_runner.rb' )

class Question

  @@accepted_keys = [ 'id', 'text' ]

  attr_reader :id, :text

  def initialize( params )
    purged = Question.purge_keys( params )
    checked = Question.check_values( purged )
    checked.each() do | key, value |
      instance_variable_set( "@#{key}", value )
    end
  end

  def save()
    sql = "INSERT INTO questions
          ( text ) VALUES ( $1 ) 
          RETURNING id;"
    values = [ @text ]
    result = SqlRunner.run( sql, values )
    @id = result.first()[ 'id' ].to_i()
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
    sql = "SELECT * FROM questions 
          WHERE id = $1;"
    values = [ search_id ]
    return self.map_items( sql, values ).first()
  end

  def self.find_all()
    sql = "SELECT * FROM questions ORDER BY id ASC;"
    questions = self.map_items( sql )
    return questions
  end

  def self.map_items( sql, values = [] )
    results = SqlRunner.run( sql, values )
    questions = results.map { |question| Question.new( question ) }
    return questions
  end



end