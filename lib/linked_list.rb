class LinkedList
  attr_reader :head

  def initialize
    @head = head
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

  def append(surname)
    current = @head
    if @head.nil?
      @head = Node.new(surname)
      else until current.next_node.nil?
        current = current.next_node
      end
      current.next_node = Node.new(surname)
    end
  end

  def prepend(surname)
    if head.nil?
      @head = Node.new(surname)
    else new_node = @head
      @head = Node.new(surname)
      @head.next_node = new_node
    end
  end

  def insert(position, surname)
    current = @head
    (position - 1).times { current = current.next_node }
    new_node = Node.new(surname)
    new_node.next_node = current.next_node
    current.next_node = new_node
  end

  def find(position, total)
    current = @head
    if total <= 1
      position.times { current = current.next_node }
      found = "The #{current.surname} family"
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
