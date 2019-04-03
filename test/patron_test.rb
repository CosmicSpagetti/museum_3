require 'minitest/autorun'
require 'minitest/pride'
require './lib/patron'

class PatronTest < Minitest::Test

  def test_it_exist
    bob = Patron.new("Bob", 20)
    assert_instance_of Patron, bob
  end

  def test_it_has_attributes
    bob = Patron.new("Bob", 20)

    assert_equal "Bob", bob.name
    assert_equal 20, bob.spending_money
    assert_equal [], bob.interests
  end

  def test_patron_can_learn_interests
    bob = Patron.new("Bob", 20)
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Gems and Minerals")

    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], bob.interests
  end
end
