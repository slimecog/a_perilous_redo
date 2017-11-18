class LinkedList
  attr_reader :head

  def initialize
    @head     = head
    @supplies = Hash.new(0)
  end

  def count
    current = head
    head.nil?
    count = 0
    until current.nil?
      current = current.next_node
      count += 1
    end
    count
  end

  def to_string
    current = @head
    if current.nil?
      p "No families!"
    else group = "The #{current.surname} family"
      while current.next_node != nil
        current = current.next_node
        group << ", followed by the #{current.surname} family"
      end
    end
    group
  end

  def append(surname, supplies)
    current = @head
    if @head.nil?
      @head = Node.new(surname, supplies)
      else until current.next_node.nil?
        current = current.next_node
      end
      current.next_node = Node.new(surname, supplies)
    end
    add_supplies(supplies)
  end

  def prepend(surname, supplies)
    if head.nil?
      @head = Node.new(surname, supplies)
    else new_node = @head
      @head = Node.new(surname, supplies)
      @head.next_node = new_node
    end
    add_supplies(supplies)
  end

  def insert(position, surname, supplies)
    current = @head
    (position - 1).times { current = current.next_node }
    new_node = Node.new(surname, supplies)
    new_node.next_node = current.next_node
    current.next_node = new_node
    add_supplies(supplies)
  end

  def supplies
    @supplies
  end

  def add_supplies(supplies)
    @supplies.merge!(supplies) { |_, supply, amount| supply + amount }
  end

  def find(position, total)
    current = @head
    if total <= 1
      position.times { current = current.next_node }
      "The #{current.surname} family"
    else find_more(position, total)
    end
  end

  def find_more(position, total)
    current = @head
    position.times { current = current.next_node }
    found = "The #{current.surname} family"
    (total - 1).times.each { |family| current = current.next_node
      found << ", followed by the #{current.surname} family" }
    found
  end

  def include(surname)
    to_string.downcase.include?(surname.downcase)
  end

  def pop
    current = @head
    (count - 2).times { current = current.next_node }
    last_node = current.next_node
    current.next_node = nil
    p "The #{last_node.surname} family has died of dysentery"
    last_node
  end
end
