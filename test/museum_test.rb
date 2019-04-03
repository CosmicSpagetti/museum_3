require 'minitest/autorun'
require 'minitest/pride'
require './lib/patron'
require './lib/exhibit'
require './lib/museum'

class MusuemTest < MiniTest::Test

  def test_it_exist
    dmns = Museum.new("Denver Museum of Nature and Science")

    assert_instance_of Museum, dmns
  end

  def test_it_has_attributes
    dmns = Museum.new("Denver Museum of Nature and Science")

    assert_equal "Denver Museum of Nature and Science", dmns.name
    assert_equal [], dmns.exhibits
    assert_equal [], dmns.patrons
  end

  def test_can_add_exhibits
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)

    assert_equal [gems_and_minerals, dead_sea_scrolls], dmns.exhibits
  end

  def test_can_recommend_exhibits_to_patrons_based_on_interests
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    imax = Exhibit.new("IMAX", 15)
    dmns.add_exhibit(imax)
    bob = Patron.new("Bob", 20)
    sally = Patron.new("Sally", 20)
    sally.add_interest("IMAX")
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Gems and Minerals")
    assert_equal [imax], dmns.recommend_exhibits(sally)
    assert_equal [dead_sea_scrolls, gems_and_minerals], dmns.recommend_exhibits(bob)
  end

  def test_can_admit_patrons_to_musuem_patrons
    dmns = Museum.new("Denver Museum of Nature and Science")
    bob = Patron.new("Bob", 20)
    sally = Patron.new("Sally", 20)
    dmns.admit(bob)
    dmns.admit(sally)

    assert_equal [bob, sally], dmns.patrons
  end

  def test_can_show_hash_of_exhibits_withs_patrons_of_interest
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    imax = Exhibit.new("IMAX", 15)
    dmns.add_exhibit(imax)
    bob = Patron.new("Bob", 20)
    sally = Patron.new("Sally", 20)
    dmns.admit(bob)
    dmns.admit(sally)
    sally.add_interest("IMAX")
    sally.add_interest("Dead Sea Scrolls")
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Gems and Minerals")
    require 'pry'; binding.pry
    # assert_equal expected, dmns.patrons_by_exhibit_interest
  end
end
