# magic_ball_test.rb

# This is a MiniTest test file.  It will test the MagicBall object in magic_ball.rb
# The two main testing libraries in Ruby are Minitest and RSpec.
# Minitest is simpler and more similar to most popular testing frameworks
# like JUnit and cppunit, but if you are interested, RSpec is worth checking out.

# Minitest documentation here: http://docs.seattlerb.org/minitest/

# require can be used to access gems (i.e. libraries)
# Libraries tend to be used very often in Ruby programs and especially Rails projects
# Note that you can add a .rb or not; generally Ruby devs will not do so

require 'minitest/autorun'
require_relative 'magic_ball'

# This shows subclassing in action!  MagicBallTest is a subclass of Minitest::Test
# This would be similar to:
# import Minitest.Test;
# public class MagicBallTest extends Test { ... }


class MagicBallTest < Minitest::Test

  # Methods that start with "test", and are in classes which are subclasses
  # of Minitest::Test, will be run as tests when you run this file.
  # Be careful - a common error is writing "tset_whatever" and that test
  # will never run!  This is one of the problems with an interpreted language
  # like Ruby.

  # Just like manual tests, we should always code up EXPECTED behavior in our
  # test cases, not OBSERVED behavior.  The execution of the test will determine
  # the observed behavior.  If expected behavior is not equal to the observed
  # behavior, we have a failure.

  # Verify that creating a MagicBall is an instance of MagicBall and not
  # something else.
  # Assertions are how we declare that something is correct with our code.
  # They should state the EXPECTED BEHAVIOR of the system (usually a method,
  # object, or class)
  # assert by itself checks that the following statement returns true
  # refute by itself would check that the following statement returns false
  
  def test_magic_ball_is_magic_ball
    magic_ball = MagicBall::new
    assert magic_ball.is_a?(MagicBall)
  end

  # Very simple test - check that creating a new MagicBall creates
  # a new MagicBall and verifies that it is not nil.
  # nil is similar to Java's null
  # refute can be read as "assert not" - that is, refute_nil would
  # be the same as the (nonexistent) "assert_not_nil"
  def test_magic_ball_new_not_nil
    magic_ball = MagicBall::new
    refute_nil magic_ball
  end

  # Verify that calling the shake method returns "SHAKE SHAKE SHAKE"
  def test_shake_shake_shake_shake
    magic_ball = MagicBall::new
    assert_equal "SHAKE SHAKE SHAKE", magic_ball.shake
  end
  
  # assert_includes means "assert that the result exists in the array
  # MagicBall::ANSWERS.
  # You can obtain a constant/class variable using ::, which we have been
  # doing for ::new but is also available for other things
  # This calls the ask method on a new MagicBall the question "Meow?"
  # This should return a string which should be something in MagicBall::ANSWERS
  def test_ask_returns_an_answer
    magic_ball = MagicBall::new
    assert_includes MagicBall::ANSWERS, magic_ball.ask("Meow?")
  end

  # Check that sending in a command with spaces works as expected
  
  def test_ask_spaces_returns_answer
    magic_ball = MagicBall::new
    assert_includes MagicBall::ANSWERS, magic_ball.ask("Meow meow meow meow meow?")
  end

  
  # This is another way of stating:
  # assert MagicBall::ANSWERS.is_a?(Array)
  
  def test_predefined_answers_is_array
    assert_kind_of Array, MagicBall::ANSWERS
  end

  # MagicBall::ANSWERS should have > 0 elements.
  # Note that we are not determining EXACTLY how many elements should be in
  # the array.  This would lead to brittle tests that would fail after
  # every modification.  It's a balance between being _specific_ and avoiding
  # being _brittle_.
  
  def test_predefined_answers_is_not_empty
    refute_empty MagicBall::ANSWERS
  end

  # Checks to see if we send in a number (and not a string) to the ask
  # method of MagicBall that it should raise an exception
  # Note the do...end.  This is a code block (just like in Java - { })
  # do..end and {..} are both acceptable in Ruby.  
  
  def test_raises_error_when_question_is_number
    assert_raises "Question has invalid format." do
      magic_ball = MagicBall::new
      magic_ball.ask(1)
    end
  end

  # Check that the other aspect of our valid_question works -
  # that if a sentence does not end in a question mark, it is also
  # marked as invalid
  def test_raises_error_when_no_question_mark
    assert_raises "Question has invalid format." do
      magic_ball = MagicBall::new
      magic_ball.ask("This is not a question")
    end
  end
  
end
