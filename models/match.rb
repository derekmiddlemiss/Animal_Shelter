require_relative( './owner.rb' )
require_relative( './animal.rb' )
require( 'json' )

class Match

  @@importance_values = {
  'insignificant' => 0,
  'moderate' => 10,
  'very important' => 250
  }

  @@answer_strings = [ 'not much', 'moderate', 'very much' ]
  @@importance_strings = [ 'insignificant', 'moderate', 'very important' ]
  @@question_strings = [ 'How energetic are you?', 'Do you like spending time outdoors?', 'Do you enjoy being in the water?', 'Do you like a warm environment?', 'How much do you enjoy eating?' ]

  def self.answer_strings()
    @@answer_strings
  end

  def self.importance_strings()
    @@importance_strings
  end

  def self.question_strings()
    @@question_strings
  end

  def self.run_match( owner, animals )

    all_animals_results_set = []

    owner_qa_hash = JSON.parse( owner.q_and_a_string() )

    for animal in animals do

      this_animal_result = []
      this_animal_result << animal.id()
      mutual_answers = 0

      animal_qa_hash = JSON.parse( animal.q_and_a_string() )

      raise "Unequal number of questions for #{owner.name()} and #{animal.name()}" if owner_qa_hash[ 'number' ] != animal_qa_hash[ 'number' ]

      owner_score = 0
      owner_total_possible = 0
      animal_score = 0
      animal_total_possible = 0

      for question_number in 1..owner_qa_hash[ 'number' ] do

        owner_answered_this_question = owner_qa_hash[ 'answers' ][ "#{question_number}" ][0]
        animal_answered_this_question = animal_qa_hash[ 'answers' ][ "#{question_number}" ][0] 

        if owner_answered_this_question && animal_answered_this_question

          mutual_answers += 1

          owner_answer = owner_qa_hash[ 'answers' ][ "#{question_number}" ][1]
          animal_answer = animal_qa_hash[ 'answers' ][ "#{question_number}" ][1]

          owner_desired_answer = owner_qa_hash[ 'answers' ][ "#{question_number}" ][2]
          animal_desired_answer = animal_qa_hash[ 'answers' ][ "#{question_number}" ][2]

          owner_importance_string = owner_qa_hash[ 'answers' ][ "#{question_number}" ][3]
          animal_importance_string = animal_qa_hash[ 'answers' ][ "#{question_number}" ][3]

          owner_importance_value = @@importance_values[ owner_importance_string ]
          animal_importance_value = @@importance_values[ animal_importance_string ]

          owner_total_possible += animal_importance_value
          animal_total_possible += owner_importance_value

          owner_score += animal_importance_value if owner_answer == animal_desired_answer
          animal_score += owner_importance_value if animal_answer == owner_desired_answer

        end # End if mutual

      end # End question_number loop

      owner_score = ( 100.0 * owner_score.to_f() ) / owner_total_possible.to_f()
      animal_score = ( 100.0 * animal_score.to_f() ) / animal_total_possible.to_f()

      final_match_score = ( owner_score * animal_score ) ** ( 1.0 / mutual_answers.to_f() )

      this_animal_result << final_match_score

      all_animals_results_set << this_animal_result

    end # End animal loop

    all_animals_results_set_sorted = all_animals_results_set.sort { | a, b | b[1] <=> a[1] }

    return all_animals_results_set_sorted

  end

end

##############################################################################################################

lassie_qa_hash = {
  'answer_strings' => [ 'not much', 'moderate', 'very much' ],
  'importance_strings' => [ 'insignificant', 'moderate', 'very important' ],
  'number' => 5,
  'question_strings' => [ 'How energetic are you?', 'Do you like spending time outdoors?', 'Do you enjoy being in the water?', 'Do you like a warm environment?', 'How much do you enjoy eating?' ],
  'answers' => {
    1 => [ true, 'very much', 'very much', 'very important' ],
    2 => [ true, 'very much', 'very much', 'very important' ],
    3 => [ true, 'moderate', 'moderate', 'moderate' ],
    4 => [ true, 'not much', 'not much', 'moderate' ],
    5 => [ true, 'very much', 'not much', 'very important' ]
  }
}

lassie = Animal.new({
  'name' => "Lassie",
  'description' => "Beloved pooch of stage and screen, rescuer of people trapped down mine shafts.",
  'age' => 10,
  'species' => "Dog",
  'breed' => "Collie",
  'picture_url' => 'https://vignette2.wikia.nocookie.net/dreamworks/images/3/34/910171000.jpg/revision/latest?cb=20150806013011',
  'q_and_a_string' => lassie_qa_hash.to_json(),
  'adoptable' => true,
  'admission_date' => "#{Date.today()}",
  'id' => "1"
})

##############################################################################################################


bagpuss_qa_hash = {
  'answer_strings' => [ 'not much', 'moderate', 'very much' ],
  'importance_strings' => [ 'insignificant', 'moderate', 'very important' ],
  'number' => 5,
  'question_strings' => [ 'How energetic are you?', 'Do you like spending time outdoors?', 'Do you enjoy being in the water?', 'Do you like a warm environment?', 'How much do you enjoy eating?' ],
  'answers' => {
    1 => [ true, 'not much', 'not much', 'very important' ],
    2 => [ true, 'not much', 'very much', 'moderate' ],
    3 => [ true, 'not much', 'moderate', 'very important' ],
    4 => [ true, 'very much', 'very much', 'very important' ],
    5 => [ true, 'very much', 'not much', 'very important' ]
  }
}

bagpuss = Animal.new({
  'name' => "Bagpuss",
  'description' => "Tired grumpy old puss.",
  'age' => 34,
  'species' => "Cat",
  'breed' => "Sackpuss",
  'picture_url' => 'http://www.smallfilms.co.uk/bagpuss/bagpuss.jpg',
  'q_and_a_string' => bagpuss_qa_hash.to_json(),
  'adoptable' => true,
  'admission_date' => "2015-06-23",
  'id' => "2"
  })

##############################################################################################################

long_john_silver_qa_hash = {
  'answer_strings' => [ 'not much', 'moderate', 'very much' ],
  'importance_strings' => [ 'insignificant', 'moderate', 'very important' ],
  'number' => 5,
  'question_strings' => [ 'How energetic are you?', 'Do you like spending time outdoors?', 'Do you enjoy being in the water?', 'Do you like a warm environment?', 'How much do you enjoy eating?' ],
  'answers' => {
    1 => [ true, 'very much', 'very much', 'moderate' ],
    2 => [ true, 'very much', 'very much', 'moderate' ],
    3 => [ true, 'very much', 'very much', 'very important' ],
    4 => [ true, 'moderate', 'moderate', 'insignificant' ],
    5 => [ true, 'moderate', 'moderate', 'moderate' ]
  }
}

long_john_silver = Owner.new({ 
  'name' => 'Long John Silver', 
  'q_and_a_string' => long_john_silver_qa_hash.to_json(), 
  'id' => "1"
  })

##############################################################################################################

results = Match.run_match( long_john_silver, [ lassie, bagpuss ] )

p results

p Match.answer_strings()
