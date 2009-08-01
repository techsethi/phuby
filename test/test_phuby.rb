require "test/unit"
require "phuby"

class TestPhuby < Test::Unit::TestCase
  def setup
    @rt = Phuby::Runtime.new
    @rt.start
  end

  def teardown
    @rt.stop
  end

  def test_eval
    @rt.eval("$hi = 'Hello World';")
  end

  def test_eval_return_int
    @rt.eval("$hi = 2;")
    assert_equal 2, @rt['hi']
  end

  def test_eval_return_nil
    @rt.eval("$hi = null;")
    assert_nil @rt['hi']
  end

  def test_eval_return_float
    @rt.eval("$hi = 3.14159;")
    assert_equal 3.14159, @rt['hi']
  end
end
