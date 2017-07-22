require_relative( '../models/animal.rb' )
require('pry')

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

lassie.save
flipper.save
p Animal.find( flipper.id() )
p flipper


params = {
  'name' => "Flipper",
  'description' => "Beloved dolphin of stage and screen, rescuer of divers trapped in old wrecks.",
  'age' => 15,
  'species' => "dolphin",
  'breed' => "Bottlenose",
  'adoptable' => false,
  'admission_date' => "2017-05-01"
}
Animal.purge_keys( params )
puts "-----------------------------------------------"
p params
params = {
  'name' => "Flipper",
  'description' => "Beloved dolphin of stage and screen, rescuer of divers trapped in old wrecks.",
  'age' => 15,
  'species' => "dolphin",
  'breed' => "Bottlenose",
  'adoptable' => false,
  'admission_date' => "2017-05-01",
  'shouldnt be here' => 'at all in output'
}
Animal.purge_keys( params )
puts "-----------------------------------------------"
p params


