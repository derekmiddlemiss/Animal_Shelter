require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
require( 'pry' )

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

long_john_silver = Owner.new( { 'name' => 'Long John Silver' } )
dr_doolittle = Owner.new( { 'name' => 'Dr Doolittle' } )
squeaky_pete = Owner.new( { 'name' => 'Squeaky Pete' } )
padraig_post = Owner.new( { 'name' => 'Padraig Post' } )

long_john_silver.save()
dr_doolittle.save()
squeaky_pete.save()
padraig_post.save()

dr_doolittle.adopt( lassie )
