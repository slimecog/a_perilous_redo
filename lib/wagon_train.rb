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

  def randomize_animals
    bag = []
    number_bagged = (rand 0..5)
    number_bagged.times do
      animal_bagged = (rand 1..3)
      if animal_bagged == 1
        bag << "squirrel"
      elsif animal_bagged == 2
        bag << "deer"
      else bag << "bison"
      end
    end
    bag
  end

  def total_food_bagged(animals)
    squirrel_count = animals.find_all { "squirrel" }
    @squirrel_count = (squirrel_count.count) * 2
    deer_count = animals.find_all { "deer" }
    @deer_count = (deer_count.count) * 40
    bison_count = animals.find_all { "bison" }
    @bison_count = (bison_count.count) * 100
    @animal_count = (@squirrel_count + @deer_count + @bison_count)
  end

  def hunting_outcome(animals)
    animals = randomize_animals
    if @squirrel_count / 2 == 1
      squirrel_noun = "squirrel"
    else squirrel_noun = "squirrels"
    end
     "You got #{@squirrel_count / 2} #{squirrel_noun}, #{@deer_count / 40} deer and #{@bison_count / 100} bison for #{@animal_count} pounds of food."
  end

  def go_hunting
    animals = randomize_animals
    total_food_bagged = total_food_bagged(animals)
    @list.supplies["pounds of food"] += total_food_bagged
    hunting_outcome(animals)
  end
end
