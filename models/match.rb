require_relative( './owner.rb' )
require_relative( './animal.rb' )
require( 'json' )
require( 'pry' )

class Match

  def self.run_match( owner, animals )

    results = []

    owner_qa_hash = JSON.parse( owner.q_and_a_string() )

    for animal in animals do

      this_result = []
      this_result << animal.id()
      mutual_answers = 0

      animal_qa_hash = JSON.parse( animal.q_and_a_string() )

      raise "Unequal number of questions" if owner_qa_hash[ 'number' ] != animal_qa_hash[ 'number' ]

      owner_score = 0
      owner_total = 0
      animal_score = 0
      animal_total = 0

      for question_number in 1..owner_qa_hash[ 'number' ] do

        binding.pry

        if owner_qa_hash['answers']["#{question_number}"][0] && animal_qa_hash['answers']["#{question_number}"][0]
          mutual_answers += 1
        end

      end

    end

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
    1 => [ true, 'not much', 'very much', 'moderate' ],
    2 => [ true, 'moderate', 'moderate', 'moderate' ],
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

Match.run_match( long_john_silver, [lassie] )

