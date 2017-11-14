require_relative "test_helper"
require_relative "../lib/node"

class NodeTest < Minitest::Test

  def test_it_exists
    node = Node.new("Burke")

    assert_instance_of Node, node
  end

  def test_it_has_attributes_and_a_nil_next_node
    node = Node.new("Burke")

    assert_equal "Burke", node.surname
    assert_equal nil, node.next_node
  end
end
