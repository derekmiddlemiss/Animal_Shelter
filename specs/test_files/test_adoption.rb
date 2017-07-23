require( '../../models/animal.rb' )
require( '../../models/owner.rb' )

lassie = Animal.new({
  'name' => "Lassie",
  'description' => "Beloved pooch of stage and screen, rescuer of people trapped down mine shafts.",
  'age' => 10,
  'species' => "dog",
  'breed' => "Collie",
  'adoptable' => true,
  'admission_date' => "#{Date.today()}"
})
lassie.save()

flipper = Animal.new({
  'name' => "Flipper",
  'description' => "Beloved dolphin of stage and screen, rescuer of divers trapped in old wrecks.",
  'age' => 15,
  'species' => "dolphin",
  'breed' => "Bottlenose",
  'adoptable' => true,
  'admission_date' => "2017-05-01"
})
flipper.save()

long_john_silver = Owner.new( { 'name' => 'Long John Silver' } )
long_john_silver.save()

long_john_silver.adopt( lassie )
long_john_silver.adopt( flipper )

p Animal.find( lassie.id() )
p Animal.find( flipper.id() )

p long_john_silver.adopted_animals()
