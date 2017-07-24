require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
require( 'pry' )

lassie = Animal.new({
  'name' => "Lassie",
  'description' => "Beloved pooch of stage and screen, rescuer of people trapped down mine shafts.",
  'age' => 10,
  'species' => "Dog",
  'breed' => "Collie",
  'adoptable' => true,
  'admission_date' => "#{Date.today()}"
})
flipper = Animal.new({
  'name' => "Flipper",
  'description' => "Beloved dolphin of stage and screen, rescuer of divers trapped in old wrecks.",
  'age' => 15,
  'species' => "Dolphin",
  'breed' => "Bottlenose",
  'adoptable' => false,
  'admission_date' => "2017-05-01"
})
skippy = Animal.new({
  'name' => "Skippy",
  'description' => "Beloved kangaroo of stage and screen, rescuer of people lost in the outback.",
  'age' => 21,
  'species' => "Kangaroo",
  'breed' => "Bush",
  'adoptable' => true,
  'admission_date' => "2017-02-14"
})
bagpuss = Animal.new({
  'name' => "Bagpuss",
  'description' => "Tired grumpy old puss.",
  'age' => 34,
  'species' => "Cat",
  'breed' => "Sackpuss",
  'adoptable' => true,
  'admission_date' => "2015-06-23"
})
colin = Animal.new({
  'name' => "Colin",
  'description' => "Energetic hound, requires constant feeding.",
  'age' => 6,
  'species' => "Dog",
  'breed' => "Miniature Schnauser",
  'adoptable' => true,
  'admission_date' => "2016-08-12"
})

lassie.save()
flipper.save()
skippy.save()
bagpuss.save()
colin.save()

long_john_silver = Owner.new( { 'name' => 'Long John Silver' } )
dr_doolittle = Owner.new( { 'name' => 'Dr Doolittle' } )
squeaky_pete = Owner.new( { 'name' => 'Squeaky Pete' } )
padraig_post = Owner.new( { 'name' => 'Padraig Post' } )

long_john_silver.save()
dr_doolittle.save()
squeaky_pete.save()
padraig_post.save()

dr_doolittle.adopt( lassie )
