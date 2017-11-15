class WagonTrain
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(surname, supplies)
    @list.append(surname, supplies)
  end

  def prepend(surname, supplies)
    @list.prepend(surname, supplies)
  end

  def insert(position, surname, supplies)
    @list.insert(position, surname, supplies)
  end

  def count
    @list.count
  end

  def to_string
    @list.to_string
  end

  def supplies
    @list.supplies
  end

  def to_string
  @list.to_string
  end
end
