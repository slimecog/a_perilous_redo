require_relative "test_helper"
require_relative "../lib/linked_list"
require_relative "../lib/node"

class LinkedListTest < Minitest::Test

  def test_it_exists
    list = LinkedList.new

    assert_instance_of LinkedList, list
  end

  def test_it_is_created_with_a_nil_head
    list = LinkedList.new

    assert_nil list.head
  end

  def test_list_can_be_appended
    list = LinkedList.new

    list.append("Burke", {"pounds of food" => 200})

    assert_instance_of Node, list.head
    assert_equal "Burke", list.head.surname
    assert_nil list.head.next_node
    assert_equal ({"pounds of food" => 200}), list.head.supplies
    assert_equal "pounds of food", list.head.supplies.first.first
    assert_equal 200, list.head.supplies.first.last
  end

  def test_linked_list_can_be_counted
    list = LinkedList.new

    list.append("Burke", {"pounds of food" => 200})

    assert_instance_of Node, list.head
    assert_equal 1, list.count

    list.append("Hardy", {"spare wagon tongues" => 3})

    assert_instance_of Node, list.head.next_node
    assert_equal 2, list.count

    assert_equal "Burke", list.head.surname
    assert_equal "Hardy", list.head.next_node.surname
  end

  def test_it_can_print_list_of_families
    list = LinkedList.new

    list.append("Burke", {"pounds of food" => 200})
    assert_equal "The Burke family", list.to_string

    list.append("Hardy", {"spare wagon tongues" => 3})
    assert_equal "The Burke family, followed by the Hardy family", list.to_string
  end

  def test_list_can_be_prepended
    list = LinkedList.new

    list.append("Burke", {"pounds of food" => 200})
    list.append("Hardy", {"spare wagon tongues" => 3})
    list.prepend("McKinney", {"spare wagon wheels" => 3})

    assert_equal "McKinney", list.head.surname
    assert_equal "Burke", list.head.next_node.surname
    assert_equal "Hardy", list.head.next_node.next_node.surname
    assert_equal "The McKinney family, followed by the Burke family, followed by the Hardy family", list.to_string
    assert_equal 3, list.count
    assert_nil list.head.next_node.next_node.next_node
  end

  def test_list_can_have_families_inserted
    list = LinkedList.new
    list.append("Burke", {"pounds of food" => 200})
    list.append("Hardy", {"spare wagon tongues" => 3})
    list.prepend("McKinney", {"spare wagon wheels" => 3})
    list.insert(1, "Lawson", {"spare wagon axles" => 3})

    assert_equal "McKinney", list.head.surname
    assert_equal "Lawson", list.head.next_node.surname
    assert_equal "Burke", list.head.next_node.next_node.surname
    assert_equal "Hardy", list.head.next_node.next_node.next_node.surname
    assert_equal 4, list.count
    assert_nil list.head.next_node.next_node.next_node.next_node
  end

  def test_families_can_be_found_by_position
    list = LinkedList.new
    list.append("Burke", {"pounds of food" => 200})
    list.append("Hardy", {"spare wagon tongues" => 3})
    list.prepend("McKinney", {"spare wagon wheels" => 3})
    list.insert(1, "Lawson", {"spare wagon axles" => 3})

    assert_equal "The Lawson family", list.find(1, 1)
    assert_equal "The Burke family", list.find(2, 1)
    assert_equal "The Lawson family, followed by the Burke family, followed by the Hardy family", list.find(1, 3)
    assert_equal "The McKinney family", list.find(0, 1)
    assert_equal "The Burke family, followed by the Hardy family", list.find(2, 2)
  end

  def test_families_can_be_found_with_includes
    list = LinkedList.new
    list.append("Burke", {"pounds of food" => 200})
    list.append("Hardy", {"spare wagon tongues" => 3})
    list.prepend("McKinney", {"spare wagon wheels" => 3})
    list.insert(1, "Lawson", {"spare wagon axles" => 3})

    assert list.include("Burke")
    assert list.include("Hardy")
    assert list.include("McKinney")
    assert list.include("Lawson")
    refute list.include("Johnson")
  end

  def test_pop_kills_last_family_with_dysentery
    list = LinkedList.new
    list.append("Burke", {"pounds of food" => 200})
    list.append("Hardy", {"spare wagon tongues" => 3})
    list.prepend("McKinney", {"spare wagon wheels" => 3})
    list.insert(1, "Lawson", {"spare wagon axles" => 3})
    expected = list.pop

    assert_instance_of Node, expected
    assert_equal "The McKinney family, followed by the Lawson family, followed by the Burke family", list.to_string

    expected = list.pop

    assert_equal "The McKinney family, followed by the Lawson family", list.to_string
  end
end
