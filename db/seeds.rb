require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )

lassie = Animal.new({
  'name' => "Lassie",
  'description' => "Beloved pooch of stage and screen, rescuer of people trapped down mine shafts.",
  'age' => 10,
  'species' => "dog",
  'breed' => "Collie",
  'adoptable' => true,
  'admission_date' => "#{Date.today()}"
})
flipper = Animal.new({
  'name' => "Flipper",
  'description' => "Beloved dolphin of stage and screen, rescuer of divers trapped in old wrecks.",
  'age' => 15,
  'species' => "dolphin",
  'breed' => "Bottlenose",
  'adoptable' => false,
  'admission_date' => "2017-05-01"
})

lassie.save()
flipper.save()

long_john_silver = Owner.new( { 'name' => 'Long John Silver' } )
dr_doolittle = Owner.new( { 'name' => 'Dr Doolittle' })

long_john_silver.save()
dr_doolittle.save()