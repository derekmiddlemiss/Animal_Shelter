require_relative( '../models/animal_2.rb' )
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

# p lassie
# p flipper
# puts "-------------------------------------------------------"
# mr_ed = Animal.new({
#   'name' => "Mr Ed",
#   'description' => "Beloved horse of stage and screen, witty stable-bound raconteur.",
#   'age' => 22,
#   'species' => "horse",
#   'breed' => "nag",
#   'adoptable' => false,
#   'admission_date' => "2017-05-01",
#   'shouldnt get through' => "at all"
# })
# mr_ed.save()
# p mr_ed

p Animal.find( flipper.id() )
flipper.update( { 'name' => "Mr Flipper" })
p Animal.find( flipper.id() )
flipper.update( { 'shouldnt_get_through' => "at_all" } )
p Animal.find( flipper.id() )
p flipper


