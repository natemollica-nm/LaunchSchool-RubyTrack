# frozen_string_literal: true

# You live in the city of Cartesia where all roads are laid out in a perfect grid. You arrived ten minutes too early to an appointment,
# so you decided to take the opportunity to go for a short walk. The city provides its citizens with a Walk Generating App on their
# phones -- everytime you press the button it sends you an array of one-letter strings representing directions to walk (eg. ['n', 's', 'w', 'e']).
# You always walk only a single block for each letter (direction) and you know it takes you one minute to traverse one city block, so create a
# function that will return true if the walk the app gives you will take you exactly ten minutes (you don't want to be early or late!) and
# will, of course, return you to your starting point. Return false otherwise.

# Note: you will always receive a valid array containing a random assortment of direction letters ('n', 's', 'e', or 'w' only).
# It will never give you an empty array (that's not a walk, that's standing still!).

# Application Requirements:
# 1. Cartesia (10x10) Grid
# 2. O's are non-currently present locations / X represents present location.
# 3. Auto generate 10 minute walk (i.e., 10 directions to travel in array)
# 4. 1 block = 1 minute of travel
# 5. Walk should return user to original location.

# ======== START: Var Declaration ========
# 10x10 grid representing city
CARTESIA = Array.new(10) { Array.new(10, 'O') }

# Hashtable to map North, East, South, West 
#   to corresponding direction movement.
DIRECTIONS = { 'N': 1, 'E': 1, 'S': -1, 'W': -1 }

# Limiting coordinate positions to 10x10 grid.
coordinates = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# Current x,y positional coordinates.
coords = { x: coordinates.sample, y: coordinates.sample }
start_coords = { x: coords[:x], y: coords[:y] }

# Setting inital coordinate positino on cartesia grid.
CARTESIA[coords[:x]][coords[:y]] = 'X'
# END: ======== END: Var Declaration ========

# ======== START: Function Definitions ========
def print_array(in_array) in_array.each { |x| puts x.join(' ') }; end
def clear system('clear') || system('cls'); end

def walk (coord_hash, dir)
  x = coord_hash[:x]
  y = coord_hash[:y]
  if dir == :N || dir == :S; y = y + DIRECTIONS[dir]; end
  if dir == :E || dir == :W; x = x + DIRECTIONS[dir]; end
  if (x < 10) && (x > -1) && (y < 10) && (y > -1)
    CARTESIA[coord_hash[:x]][coord_hash[:y]] = '*'
    coord_hash[:x] = x
    coord_hash[:y] = y
    CARTESIA[coord_hash[:x]][coord_hash[:y]] = 'X'
  end
end

def walk_generator
  route = []
  route << DIRECTIONS.keys.sample while route.count < 10
  return route if (route.count(:W) == route.count(:E)) && (route.count(:N) == route.count(:S))
  route = []
  walk_generator
end

def is_valid_walk(walk, final, start)
  (walk.count == 10) && (walk.map { |dir| DIRECTIONS[dir] }.sum) == 0 && (final == start)
end
# ======== END: Function Definitions ========

# ======== START: Main Program ========
rand_route = walk_generator
step_arr = {}
i = 1
rand_route.each do |dir|
  walk(coords, dir)
  sleep 1
  clear()
  step_arr[i] = [coords[:x],coords[:y]]
  puts "Step: #{i} => (#{coords[:x]},#{coords[:y]})"
  print_array(CARTESIA)
  puts "==================="
  i += 1
end
clear()
puts "Start Pos => (#{start_coords[:x]},#{start_coords[:y]}) / Final Pos => (#{coords[:x]},#{coords[:y]})"
print_array(CARTESIA)
puts "==================="
step_arr.each {|step| puts "#{step}" }
puts "Random Walk Route #{rand_route}"
puts "Valid Walk: #{is_valid_walk(rand_route, coords, start_coords)}"
# ======== END: Main Program ========
