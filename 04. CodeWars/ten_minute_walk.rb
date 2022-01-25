# You live in the city of Cartesia where all roads are laid out in a perfect grid. You arrived ten minutes too early to an appointment, 
# so you decided to take the opportunity to go for a short walk. The city provides its citizens with a Walk Generating App on their 
# phones -- everytime you press the button it sends you an array of one-letter strings representing directions to walk (eg. ['n', 's', 'w', 'e']). 
# You always walk only a single block for each letter (direction) and you know it takes you one minute to traverse one city block, so create a 
# function that will return true if the walk the app gives you will take you exactly ten minutes (you don't want to be early or late!) and 
# will, of course, return you to your starting point. Return false otherwise.

# Note: you will always receive a valid array containing a random assortment of direction letters ('n', 's', 'e', or 'w' only). 
# It will never give you an empty array (that's not a walk, that's standing still!).
CARTESIA = Array.new(10) {Array.new(10,'O')}
DIRECTIONS = {'N' => 1, 'E' => 1, 'S' => -1, 'W' => -1}
COORDINATES = [0,1,2,3,4,5,6,7,8,9]
def print_array(in_array)
  in_array.each { |x| puts x.join(" ")} 
end

x = 5 #COORDINATES.sample
y = 5 #COORDINATES.sample
coords = [x,y]
CARTESIA[coords[0]][coords[1]] = 'X'

def check_bounds(coord_arr, dir)
  if ( dir == 'E') || (dir == 'W')
    x_mov = x + DIRECTIONS[dir]
    coord_arr[0] = x_mov if (x_mov < 10) && (x_mov > -1)
  end
  if ( dir == 'N') || (dir == 'S')
    y_mov = x + DIRECTIONS[dir] 
    coord_arr[1] = y_mov if (y_mov < 10) && (y_mov > -1)
  end
end

def walk(dir)

end

def walk_generator
  route = []
  while route.count < 10
    route << DIRECTIONS.keys.sample
  end
  route
end

rand_route = walk_generator
rand_route.each do |dir|

end

print_array(CARTESIA)

def is_valid_walk(walk)
  
end



