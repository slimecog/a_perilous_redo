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

    wt.append("Burke")
    wt.append("West")

    assert_equal "Burke", wt.list.head.surname
    assert_equal "West", wt.list.head.next_node.surname
  end

  def test_WTs_linked_list_can_be_counted
    wt = WagonTrain.new

    wt.append("Burke")
    wt.append("West")

    assert_equal 2, wt.count
  end
end
