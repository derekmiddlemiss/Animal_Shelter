require( 'minitest/autorun' )
require_relative ('../models/animal_2.rb' )
require( 'date' )

class TestOwner < MiniTest::Test

  def setup()
    @lassie = Animal.new({
      'name' => "Lassie",
      'description' => "Beloved pooch of stage and screen, rescuer of people trapped down mine shafts.",
      'age' => 10,
      'species' => "dog",
      'breed' => "Collie",
      'adoptable' => true,
      'admission_date' => "#{Date.today()}"
    })
    @flipper = Animal.new({
      'name' => "Flipper",
      'description' => "Beloved dolphin of stage and screen, rescuer of divers trapped in old wrecks.",
      'age' => 15,
      'species' => "dolphin",
      'breed' => "Bottlenose",
      'adoptable' => false,
      'admission_date' => "2017-05-01"
    })
    @lassie.save()
    @flipper.save()
  end

  def test_find()
    found = Animal.find( @flipper.id() )
    actual = [ found.id(), found.name(), found.description(),
              found.age(), found.species(), found.breed(), 
              found.adoptable(), found.admission_date(),
              found.adoption_date(), found.owner_id() ]
    expected = [ @flipper.id(), @flipper.name(), 
              @flipper.description(), @flipper.age(), 
              @flipper.species(), @flipper.breed(), 
              @flipper.adoptable(), @flipper.admission_date(),
              @flipper.adoption_date(), @flipper.owner_id() ]
    assert_equal( actual, expected )
  end

  def test_find_all()
    array = Animal.find_all()
    actual_last = [ array[-1].id(), array[-1].name(), 
                  array[-1].description(), array[-1].age(),
                  array[-1].species(), array[-1].breed(), 
                  array[-1].adoptable(), 
                  array[-1].admission_date(),
                  array[-1].adoption_date(), 
                  array[-1].owner_id() ]
    actual_next_last = [ array[-2].id(), array[-2].name(), 
                  array[-2].description(), array[-2].age(),
                  array[-2].species(), array[-2].breed(), 
                  array[-2].adoptable(), 
                  array[-2].admission_date(),
                  array[-2].adoption_date(), 
                  array[-2].owner_id() ]
    expected_last = [ @flipper.id(), @flipper.name(), 
              @flipper.description(), @flipper.age(), 
              @flipper.species(), @flipper.breed(), 
              @flipper.adoptable(), @flipper.admission_date(),
              @flipper.adoption_date(), @flipper.owner_id() ]
    expected_next_last = [ @lassie.id(), @lassie.name(), 
              @lassie.description(), @lassie.age(), 
              @lassie.species(), @lassie.breed(), 
              @lassie.adoptable(), @lassie.admission_date(),
              @lassie.adoption_date(), @lassie.owner_id() ]
    assert_equal( expected_last, actual_last )
    assert_equal( expected_next_last, actual_next_last )
  end

  def test_update()
    @flipper.update( { 'name' => 'Mr Flipper' } )
    found = Animal.find( @flipper.id() )
    actual = [ found.id(), found.name(), found.description(),
              found.age(), found.species(), found.breed(), 
              found.adoptable(), found.admission_date(),
              found.adoption_date(), found.owner_id() ]
    expected = [ @flipper.id(), @flipper.name(), 
              @flipper.description(), @flipper.age(), 
              @flipper.species(), @flipper.breed(), 
              @flipper.adoptable(), @flipper.admission_date(),
              @flipper.adoption_date(), @flipper.owner_id() ]
    assert_equal( actual, expected )
  end

  def test_delete()
    @lassie.delete()
    found = Animal.find( @lassie.id() )
    assert_nil( found )
  end

end