require_relative "test_helper"
require_relative "../lib/wagon_train"
require_relative "../lib/linked_list"
require_relative "../lib/node"

class WagonTrainTest < Minitest::Test

  def test_it_exists
    wt = WagonTrain.new

    assert_instance_of WagonTrain, wt
  end

  def test_it_instantiates_with_linked_list_attribute
    wt = WagonTrain.new

    assert_instance_of LinkedList, wt.list
  end

  def test_WTs_linked_list_starts_with_nil_head
    wt = WagonTrain.new

    assert_nil wt.list.head
  end

  def test_WTs_linked_list_is_appendable
    wt = WagonTrain.new

    wt.append("Burke", {"pounds of food" => 200})
    wt.append("Hardy", {"spare wagon wheels" => 3})

    assert_equal "Burke", wt.list.head.surname
    assert_equal "Hardy", wt.list.head.next_node.surname
  end

  def test_WTs_linked_list_can_be_counted
    wt = WagonTrain.new

    wt.append("Burke", {"pounds of food" => 200})
    wt.append("Hardy", {"spare wagon wheels" => 3})

    assert_equal 2, wt.count
  end

  def test_prepend_and_insert_work
    wt = WagonTrain.new

    wt.append("Burke", {"pounds of food" => 200})
    wt.append("Hardy", {"spare wagon wheels" => 3})
    wt.prepend("McKinney", {"spare wagon wheels" => 3})
    wt.insert(1, "Lawson", {"spare wagon axles" => 3})

    assert_equal 4, wt.count
    assert_equal "McKinney", wt.list.head.surname
    assert_equal "Lawson", wt.list.head.next_node.surname
    assert_equal "Burke", wt.list.head.next_node.next_node.surname
    assert_equal "Hardy", wt.list.head.next_node.next_node.next_node.surname
  end

  def test_wagon_supplies_can_be_totaled_can_keys_not_duplicated
    wt = WagonTrain.new

    wt.append("Burke", {"pounds of food" => 200})
    wt.append("Hardy", {"spare wagon wheels" => 3})
    wt.prepend("McKinney", {"spare wagon wheels" => 3})
    wt.insert(1, "Lawson", {"spare wagon axles" => 3})

    assert_instance_of Hash, wt.supplies
    assert_equal "pounds of food", wt.supplies.first.first
    assert_equal 200, wt.supplies.first.last
    assert_equal 6, wt.supplies["spare wagon wheels"]
  end

  def test_hunting_animals_are_random
    wt = WagonTrain.new

    wt.append("Burke", {"pounds of food" => 200})

    assert_instance_of Array, wt.randomize_animals
  end

  def test_hunting_adds_animals_to_total_food_bagged
    wt = WagonTrain.new

    wt.append("Burke", {"pounds of food" => 200})

    animals = wt.randomize_animals

    refute_nil wt.total_food_bagged(animals)
  end

  def test_hunting_adds_food_to_supplies
    wt = WagonTrain.new

    wt.append("Burke", {"pounds of food" => 0})

    refute_nil wt.supplies, wt.go_hunting
    #this will fail from time to time as hunting will
    #sometimes produce no new food
  end

end
