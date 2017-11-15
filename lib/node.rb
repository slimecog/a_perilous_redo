class Node
  attr_reader   :surname,
                :supplies
  attr_accessor :next_node

  def initialize(surname, supplies)
    @surname   = surname
    @supplies  = supplies
    @next_node = next_node
  end
end
