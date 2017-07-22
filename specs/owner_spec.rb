require( 'minitest/autorun' )
require_relative ( '../models/owner_2.rb' )

class TestOwner < MiniTest::Test

  def setup()
    @long_john_silver = Owner.new( { 'name' => 'Long John Silver' } )
    @dr_doolittle = Owner.new( { 'name' => 'Dr Doolittle' })
    @long_john_silver.save()
    @dr_doolittle.save()
  end

  def test_find()
    found = Owner.find( @long_john_silver.id() )
    actual = [ found.name(), found.id() ]
    expected = [ @long_john_silver.name(), @long_john_silver.id() ]
    assert_equal( expected, actual )
  end

  def test_find_all()
    found_array = Owner.find_all()
    actual_last = [ found_array[-1].name(), found_array[-1].id() ]
    actual_next_last = [ found_array[-2].name(), found_array[-2].id() ]
    expected_last = [ @dr_doolittle.name(), @dr_doolittle.id() ]
    expected_next_last = [ @long_john_silver.name(), @long_john_silver.id() ]

    assert_equal( expected_last, actual_last )
    assert_equal( expected_next_last, actual_next_last )
  end

  def test_update()
    @dr_doolittle.update( { 'name' => "Dr John Doolittle" } )
    found = Owner.find( @dr_doolittle.id() )
    actual = [ found.name(), found.id() ]
    expected = [ @dr_doolittle.name(), @dr_doolittle.id() ]
    assert_equal( expected, actual )
  end

  def test_delete()
    @long_john_silver.delete()
    found = Owner.find( @long_john_silver.id() )
    assert_nil( found )
  end

end