require( 'minitest/autorun' )
require_relative ('../models/boolean_handler.rb' )

class TestBoolean < MiniTest::Test

  def test_true_string()
    result = BooleanHandler.convert( "true" )
    assert_equal( true, result )
  end

  def test_true_obj()
    result = BooleanHandler.convert( true )
    assert_equal( true, result )
  end

  def test_false_string()
    result = BooleanHandler.convert( "false" )
    assert_equal( false, result )
  end

  def test_false_obj()
    result = BooleanHandler.convert( false )
    assert_equal( false, result )
  end

  def test_t_string()
    result = BooleanHandler.convert( "t" )
    assert_equal( true, result )
  end

  def test_f_string()
    result = BooleanHandler.convert( "f" )
    assert_equal( false, result )
  end  

  def test_caps_full_strings()
    result1 = BooleanHandler.convert( "TrUe" )
    result2 = BooleanHandler.convert( "FaLse" )
    assert_equal( true, result1 )
    assert_equal( false, result2 )
  end  

  def test_caps_letters()
    result1 = BooleanHandler.convert( "T" )
    result2 = BooleanHandler.convert( "F" )
    assert_equal( true, result1 )
    assert_equal( false, result2 )
  end

end
