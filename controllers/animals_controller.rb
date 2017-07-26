require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/question.rb' )
require_relative( '../models/answer.rb' )
require( 'pry' )

get '/animals' do
  @animals = Animal.find_all()
  erb( :"animals/index" )
end

get '/animals/new' do
  erb( :"animals/new")
end

post '/animals' do
  animal = Animal.new( params )
  animal.save()
  redirect to "/animals"
end

get '/animals/:id' do
  @animal = Animal.find( params['id'] )
  @owner = @animal.get_owner()
  @answers = @animal.get_answers()
  erb( :"animals/show" )
end

get '/animals/:id/edit' do
  @animal = Animal.find( params['id'] )
  @owner = @animal.get_owner()
  erb( :"animals/edit" )
end

post '/animals/:id' do
  animal = Animal.find( params[ 'id' ] )
  animal.update( params )
  redirect to "/animals"
end

get '/animals/:id/delete' do
  animal = Animal.find( params[ 'id' ] )
  animal.delete()
  redirect to "/animals"
end

get '/animals/:id/answers/edit' do
  @animal = Animal.find( params['id'] )
  @questions = Question.find_all()
  erb( :"animals/answers/edit" )
end

post '/animals/:id/answers' do
  animal = Animal.find( params['id'] )
  answers_hash = Answer.hash_parser( params, "animal" )
  answers_hash.each do | question_id, hash |
    if animal.get_answer( question_id ) != nil
      answer = animal.get_answer( question_id )
      answer.update( hash )
    else
      answer = Answer.new( hash )
      answer.save()
    end
  end
  redirect to "/animals" 
end
