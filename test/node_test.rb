require_relative "test_helper"
require_relative "../lib/node"

class NodeTest < Minitest::Test

  def test_it_exists
    node = Node.new("Burke", {"pounds of food" => 200})

    assert_instance_of Node, node
  end

  def test_it_has_attributes_and_a_nil_next_node
    node = Node.new("Burke", {"pounds of food" => 200})

    assert_equal "Burke", node.surname
    assert_nil node.next_node
  end
end
