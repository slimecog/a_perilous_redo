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

    list.append("Burke")

    assert_instance_of Node, list.head
    assert_equal "Burke", list.head.surname
    assert_nil list.head.next_node
  end

  def test_linked_list_can_be_counted
    list = LinkedList.new

    list.append("Burke")

    assert_instance_of Node, list.head
    assert_equal 1, list.count

    list.append("West")

    assert_instance_of Node, list.head.next_node
    assert_equal 2, list.count

    assert_equal "Burke", list.head.surname
    assert_equal "West", list.head.next_node.surname
  end

  def test_it_can_print_list_of_families
    list = LinkedList.new

    list.append("Burke")
    assert_equal "The Burke family", list.to_string

    list.append("West")
    assert_equal "The Burke family, followed by the West family", list.to_string
  end

  def test_list_can_be_prepended
    list = LinkedList.new

    list.append("Brooks")
    list.append("Henderson")
    list.prepend("McKinney")

    assert_equal "McKinney", list.head.surname
    assert_equal "Brooks", list.head.next_node.surname
    assert_equal "Henderson", list.head.next_node.next_node.surname
    assert_equal "The McKinney family, followed by the Brooks family, followed by the Henderson family", list.to_string
    assert_equal 3, list.count
    assert_nil list.head.next_node.next_node.next_node
  end

  def test_list_can_have_families_inserted
    list = LinkedList.new
    list.append("Brooks")
    list.append("Henderson")
    list.prepend("McKinney")
    list.insert(1, "Lawson")

    assert_equal "McKinney", list.head.surname
    assert_equal "Lawson", list.head.next_node.surname
    assert_equal "Brooks", list.head.next_node.next_node.surname
    assert_equal "Henderson", list.head.next_node.next_node.next_node.surname
    assert_equal 4, list.count
    assert_nil list.head.next_node.next_node.next_node.next_node
  end

  def test_families_can_be_found_by_position
    list = LinkedList.new
    list.append("Brooks")
    list.append("Henderson")
    list.prepend("McKinney")
    list.insert(1, "Lawson")

    assert_equal "The Lawson family", list.find(1, 1)
    assert_equal "The Brooks family", list.find(2, 1)
    assert_equal "The Lawson family, followed by the Brooks family, followed by the Henderson family", list.find(1, 3)
    assert_equal "The McKinney family", list.find(0, 1)
    assert_equal "The Brooks family, followed by the Henderson family", list.find(2, 2)
  end

  def test_families_can_be_found_with_includes
    list = LinkedList.new
    list.append("Brooks")
    list.append("Henderson")
    list.prepend("McKinney")
    list.insert(1, "Lawson")

    assert list.include("Brooks")
    assert list.include("Henderson")
    assert list.include("McKinney")
    assert list.include("Lawson")
    refute list.include("Johnson")
  end

  def test_pop_kills_last_family_with_dysentery
    list = LinkedList.new
    list.append("Brooks")
    list.append("Henderson")
    list.prepend("McKinney")
    list.insert(1, "Lawson")
    expected = list.pop

    assert_instance_of Node, expected
    assert_equal "The McKinney family, followed by the Lawson family, followed by the Brooks family", list.to_string

    expected = list.pop

    assert_equal "The McKinney family, followed by the Lawson family", list.to_string
  end
end
