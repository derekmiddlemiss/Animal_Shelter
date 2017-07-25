require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/question.rb' )
require_relative( '../models/answer.rb' )
require( 'pry' )

# ANIMALS ####################################################################


lassie = Animal.new({
  'name' => "Lassie",
  'description' => "Beloved pooch of stage and screen, rescuer of people trapped down mine shafts.",
  'age' => 10,
  'species' => "Dog",
  'breed' => "Collie",
  'picture_url' => 'https://vignette2.wikia.nocookie.net/dreamworks/images/3/34/910171000.jpg/revision/latest?cb=20150806013011',
  'adoptable' => true,
  'admission_date' => "#{Date.today()}"
})
flipper = Animal.new({
  'name' => "Flipper",
  'description' => "Beloved dolphin of stage and screen, rescuer of divers trapped in old wrecks.",
  'age' => 15,
  'species' => "Dolphin",
  'breed' => "Bottlenose",
  'picture_url' => 'https://s-media-cache-ak0.pinimg.com/736x/f6/a9/3c/f6a93cd49ed72a026159c6c2e2a3c264--flipper-killer-whales.jpg',
  'adoptable' => false,
  'admission_date' => "2017-05-01"
})
skippy = Animal.new({
  'name' => "Skippy",
  'description' => "Beloved kangaroo of stage and screen, rescuer of people lost in the outback.",
  'age' => 21,
  'species' => "Kangaroo",
  'breed' => "Bush",
  'picture_url' => 'https://www.classicaustraliantv.com/Skippy/SK15.jpg',
  'adoptable' => true,
  'admission_date' => "2017-02-14"
})
bagpuss = Animal.new({
  'name' => "Bagpuss",
  'description' => "Tired grumpy old puss.",
  'age' => 34,
  'species' => "Cat",
  'breed' => "Sackpuss",
  'picture_url' => 'http://www.smallfilms.co.uk/bagpuss/bagpuss.jpg',
  'adoptable' => true,
  'admission_date' => "2015-06-23"
})
colin = Animal.new({
  'name' => "Colin",
  'description' => "Energetic hound, requires constant feeding.",
  'age' => 6,
  'species' => "Dog",
  'breed' => "Miniature Schnauser",
  'picture_url' => 'https://vignette4.wikia.nocookie.net/spaced/images/c/c6/Colin.jpg/revision/latest?cb=20100221014518',
  'adoptable' => true,
  'admission_date' => "2016-08-12"
})

lassie.save()
flipper.save()
skippy.save()
bagpuss.save()
colin.save()

# OWNERS ####################################################################

long_john_silver = Owner.new( { 'name' => 'Long John Silver' } )
dr_doolittle = Owner.new( { 'name' => 'Dr Doolittle' } )

long_john_silver.save()
dr_doolittle.save()

dr_doolittle.adopt( lassie )

# QUESTIONS ####################################################################


energy = Question.new( { 'text' => 'How energetic are you?' } )
outdoors = Question.new( { 'text' => 'Do you like spending time outdoors?' } )
water = Question.new( { 'text' => 'Do you enjoy being in the water?' } )
warm = Question.new( { 'text' => 'Do you like a warm environment?' } )
appetite = Question.new( { 'text' => 'How much do you enjoy eating?' } )

energy.save()
outdoors.save()
water.save()
warm.save()
appetite.save()

# ANSWERS ####################################################################

lassie_q1 = Answer.new( {
  'question_id' => 1,
  'animal_id' => lassie.id(),
  'own_answer' => 'very much',
  'desired_answer' => 'very much',
  'importance' => 'very important'
  } )
lassie_q2 = Answer.new( {
  'question_id' => 2,
  'animal_id' => lassie.id(),
  'own_answer' => 'very much',
  'desired_answer' => 'very much',
  'importance' => 'very important'
  } )
lassie_q3 = Answer.new( {
  'question_id' => 3,
  'animal_id' => lassie.id(),
  'own_answer' => 'moderate',
  'desired_answer' => 'moderate',
  'importance' => 'moderate'
  } )
lassie_q4 = Answer.new( {
  'question_id' => 4,
  'animal_id' => lassie.id(),
  'own_answer' => 'not much',
  'desired_answer' => 'not much',
  'importance' => 'moderate'
  } )
lassie_q5 = Answer.new( {
  'question_id' => 5,
  'animal_id' => lassie.id(),
  'own_answer' => 'very much',
  'desired_answer' => 'not much',
  'importance' => 'very important'
  } )
lassie_q1.save()
lassie_q2.save()
lassie_q3.save()
lassie_q4.save()
lassie_q5.save()

flipper_q1 = Answer.new( {
  'question_id' => 1,
  'animal_id' => flipper.id(),
  'own_answer' => 'very much',
  'desired_answer' => 'very much',
  'importance' => 'moderate'
  } )
flipper_q2 = Answer.new( {
  'question_id' => 2,
  'animal_id' => flipper.id(),
  'own_answer' => 'not much',
  'desired_answer' => 'not much',
  'importance' => 'very important'
  } )
flipper_q3 = Answer.new( {
  'question_id' => 3,
  'animal_id' => flipper.id(),
  'own_answer' => 'very much',
  'desired_answer' => 'very much',
  'importance' => 'very important'
  } )
flipper_q4 = Answer.new( {
  'question_id' => 4,
  'animal_id' => flipper.id(),
  'own_answer' => 'not much',
  'desired_answer' => 'not much',
  'importance' => 'moderate'
  } )
flipper_q5 = Answer.new( {
  'question_id' => 5,
  'animal_id' => flipper.id(),
  'own_answer' => 'moderate',
  'desired_answer' => 'moderate',
  'importance' => 'insignificant'
  } )
flipper_q1.save()
flipper_q2.save()
flipper_q3.save()
flipper_q4.save()
flipper_q5.save()

skippy_q1 = Answer.new( {
  'question_id' => 1,
  'animal_id' => skippy.id(),
  'own_answer' => 'very much',
  'desired_answer' => 'very much',
  'importance' => 'moderate'
  } )
skippy_q2 = Answer.new( {
  'question_id' => 2,
  'animal_id' => skippy.id(),
  'own_answer' => 'very much',
  'desired_answer' => 'very much',
  'importance' => 'very important'
  } )
skippy_q3 = Answer.new( {
  'question_id' => 3,
  'animal_id' => skippy.id(),
  'own_answer' => 'not much',
  'desired_answer' => 'not much',
  'importance' => 'very important'
  } )
skippy_q4 = Answer.new( {
  'question_id' => 4,
  'animal_id' => skippy.id(),
  'own_answer' => 'very much',
  'desired_answer' => 'very much',
  'importance' => 'very important'
  } )
skippy_q5 = Answer.new( {
  'question_id' => 4,
  'animal_id' => skippy.id(),
  'own_answer' => 'moderate',
  'desired_answer' => 'moderate',
  'importance' => 'insignificant'
  } )
skippy_q1.save()
skippy_q2.save()
skippy_q3.save()
skippy_q4.save()
skippy_q5.save()

bagpuss_q1 = Answer.new( {
  'question_id' => 1,
  'animal_id' => bagpuss.id(),
  'own_answer' => 'not much',
  'desired_answer' => 'not much',
  'importance' => 'very important'
  } )
bagpuss_q2 = Answer.new( {
  'question_id' => 2,
  'animal_id' => bagpuss.id(),
  'own_answer' => 'not much',
  'desired_answer' => 'very much',
  'importance' => 'moderate'
  } )
bagpuss_q3 = Answer.new( {
  'question_id' => 3,
  'animal_id' => bagpuss.id(),
  'own_answer' => 'not much',
  'desired_answer' => 'moderate',
  'importance' => 'very important'
  } )
bagpuss_q4 = Answer.new( {
  'question_id' => 4,
  'animal_id' => bagpuss.id(),
  'own_answer' => 'very much',
  'desired_answer' => 'very much',
  'importance' => 'very important'
  } )
bagpuss_q5 = Answer.new( {
  'question_id' => 5,
  'animal_id' => bagpuss.id(),
  'own_answer' => 'very much',
  'desired_answer' => 'not much',
  'importance' => 'very important'
  } )
bagpuss_q1.save()
bagpuss_q2.save()
bagpuss_q3.save()
bagpuss_q4.save()
bagpuss_q5.save()

colin_q1 = Answer.new( {
  'question_id' => 1,
  'animal_id' => colin.id(),
  'own_answer' => 'not much',
  'desired_answer' => 'moderate',
  'importance' => 'moderate'
  } )
colin_q2 = Answer.new( {
  'question_id' => 2,
  'animal_id' => colin.id(),
  'own_answer' => 'not much',
  'desired_answer' => 'not much',
  'importance' => 'moderate'
  } )
colin_q3 = Answer.new( {
  'question_id' => 3,
  'animal_id' => colin.id(),
  'own_answer' => 'not much',
  'desired_answer' => 'not much',
  'importance' => 'very important'
  } )
colin_q4 = Answer.new ( {
  'question_id' => 4,
  'animal_id' => colin.id(),
  'own_answer' => 'very much',
  'desired_answer' => 'very much',
  'importance' => 'very important'
  } )
colin_q5 = Answer.new ( {
  'question_id' => 5,
  'animal_id' => colin.id(),
  'own_answer' => 'very much',
  'desired_answer' => 'not much',
  'importance' => 'moderate'
  } )
colin_q1.save()
colin_q2.save()
colin_q3.save()
colin_q4.save()
colin_q5.save()

long_john_silver_q1 = Answer.new( {
  'question_id' => 1,
  'owner_id' => long_john_silver.id(),
  'own_answer' => 'very much',
  'desired_answer' => 'very much',
  'importance' => 'moderate'
  } )
long_john_silver_q2 = Answer.new( {
  'question_id' => 2,
  'owner_id' => long_john_silver.id(),
  'own_answer' => 'very much',
  'desired_answer' => 'very much',
  'importance' => 'moderate'
  } )
long_john_silver_q3 = Answer.new( {
  'question_id' => 3,
  'owner_id' => long_john_silver.id(),
  'own_answer' => 'very much',
  'desired_answer' => 'very much',
  'importance' => 'very important'
  } )
long_john_silver_q4 = Answer.new( {
  'question_id' => 4,
  'owner_id' => long_john_silver.id(),
  'own_answer' => 'moderate',
  'desired_answer' => 'moderate',
  'importance' => 'insignificant'
  } )
long_john_silver_q5 = Answer.new( {
  'question_id' => 5,
  'owner_id' => long_john_silver.id(),
  'own_answer' => 'moderate',
  'desired_answer' => 'moderate',
  'importance' => 'moderate'
  } )
long_john_silver_q1.save()
long_john_silver_q2.save()
long_john_silver_q3.save()
long_john_silver_q4.save()
long_john_silver_q5.save()

dr_doolittle_q1 = Answer.new( {
  'question_id' => 1,
  'owner_id' => dr_doolittle.id(),
  'own_answer' => 'not much',
  'desired_answer' => 'not much',
  'importance' => 'very important'
  } )
dr_doolittle_q2 = Answer.new( {
  'question_id' => 2,
  'owner_id' => dr_doolittle.id(),
  'own_answer' => 'not much',
  'desired_answer' => 'not much',
  'importance' => 'moderate'
  } )
dr_doolittle_q3 = Answer.new( {
  'question_id' => 3,
  'owner_id' => dr_doolittle.id(),
  'own_answer' => 'not much',
  'desired_answer' => 'moderate',
  'importance' => 'insignificant'
  } )
dr_doolittle_q4 = Answer.new( {
  'question_id' => 4,
  'owner_id' => dr_doolittle.id(),
  'own_answer' => 'moderate',
  'desired_answer' => 'moderate',
  'importance' => 'moderate'
  } )
dr_doolittle_q5 = Answer.new( {
  'question_id' => 5,
  'owner_id' => dr_doolittle.id(),
  'own_answer' => 'moderate',
  'desired_answer' => 'moderate',
  'importance' => 'very important'
  } )
dr_doolittle_q1.save()
dr_doolittle_q2.save()
dr_doolittle_q3.save()
dr_doolittle_q4.save()
dr_doolittle_q5.save()


