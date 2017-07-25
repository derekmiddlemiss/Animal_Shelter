require_relative( '../db/sql_runner.rb' )
require_relative( './question.rb' )

class Answer

  @@accepted_keys = [ 'id', 'question_id', 'owner_id', 'animal_id', 'own_answer', 'desired_answer', 'importance' ]

  attr_reader :id, :question_id, :owner_id, :animal_id, :own_answer, :desired_answer, :importance

  def initialize( params )
    purged = Answer.purge_keys( params )
    checked = Answer.check_values( purged )
    checked.each() do | key, value |
      instance_variable_set( "@#{key}", value )
    end
  end  

  def save()
    sql = "INSERT INTO answers
          ( question_id, owner_id, animal_id, own_answer, desired_answer, importance ) 
          VALUES ( $1, $2, $3, $4, $5, $6 ) 
          RETURNING id;"
    values = [ @question_id, @owner_id, @animal_id, @own_answer, @desired_answer, @importance ]
    result = SqlRunner.run( sql, values )
    @id = result.first()[ 'id' ].to_i()
  end

  def update( params )
    purged = Answer.purge_keys( params )
    checked = Answer.check_values( purged )
    checked.each() do | key, value |
      instance_variable_set( "@#{key}", value )
    end
    sql = "UPDATE answers SET
          ( question_id, owner_id, animal_id, own_answer, desired_answer, importance) = 
          ( $1, $2, $3, $4, $5, $6 ) 
          WHERE id = $7;"
    values = [ @question_id, @owner_id, @animal_id, @own_answer, @desired_answer, @importance ]
    SqlRunner( sql, values )
  end

  def get_question()
    sql = "SELECT * FROM questions
          WHERE id = $1;"
    values = [ @question_id ]
    question = Question.map_items( sql, values ).first()
    return question
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
    params[ 'question_id' ] = params[ 'question_id' ].to_i() if params[ 'question_id' ]
    params[ 'owner_id' ] = params[ 'owner_id' ].to_i() if params[ 'owner_id' ]
    params[ 'animal_id' ] = params[ 'animal_id' ].to_i() if params[ 'animal_id' ]
    return params
  end

  def self.find( search_id )
    sql = "SELECT * FROM answers 
          WHERE id = $1;"
    values = [ search_id ]
    return self.map_items( sql, values ).first()
  end

  def self.map_items( sql, values = [] )
    results = SqlRunner.run( sql, values )
    answers = results.map { |answer| Answer.new( answer ) }
    return answers
  end


end