require_relative "node"
require_relative "linked_list"
require_relative "wagon_train"


wt = WagonTrain.new
# list = LinkedList.new
#
# p list
# p list.head
 wt.append("Burke", {"pounds of food" => 200})
# p list
# p list.head
# p list.head.next_node
 wt.append("Hardy", {"spare wagon wheels" => 3})
# p list.head.next_node
# p list.count
# p list.to_string
 wt.prepend("McKinney", {"pounds of food" => 300})
# p list.count
# p list.to_string
 wt.insert(1, "Lawson", {"spare wagon axles" => 3})
# p list.to_string
# p list.pop
# p list.to_string
# p list.pop
# p wt.to_string
# p wt
# p wt.append("Burke")
# p wt.append("West")
# p wt.supplies
p wt.go_hunting
p wt.supplies
