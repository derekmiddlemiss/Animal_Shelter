require_relative( './owner.rb' )
require_relative( './animal.rb' )
require_relative( './answer.rb' )
require( 'pry' )

class Match

  @@importance_values = {
  'insignificant' => 0,
  'moderate' => 10,
  'very important' => 250
  }

  def self.run_match( owner, animals )

    all_animals_results_set = []
    owner_answers = owner.get_answers()

    for animal in animals do

      this_animal_result = []
      this_animal_result << animal
      mutual_answers = 0

      animal_answers = animal.get_answers()

      owner_score = 0
      owner_total_possible = 0
      animal_score = 0
      animal_total_possible = 0

      for owner_answer in owner_answers do

        for animal_answer in animal_answers do

          if owner_answer.question_id() == animal_answer.question_id()
          
            mutual_answers += 1

            owner_importance_value = @@importance_values[ owner_answer.importance() ]
            animal_importance_value = @@importance_values[ owner_answer.importance() ]
            
            owner_total_possible += animal_importance_value
            animal_total_possible += owner_importance_value

            owner_score += animal_importance_value if owner_answer.own_answer() == animal_answer.desired_answer()
            animal_score += owner_importance_value if animal_answer.own_answer() == owner_answer.desired_answer()

          end # End if mutual

        end # animal_answer loop

      end # owner_answer loop

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

