def num_neighbors(x, y, arr)
  count = 0
  size = arr.size
  left_x = (x - 1) % size
  right_x = (x + 1) % size
  up_y = (y - 1) % size
  down_y = (y + 1) % size
  count += 1 if arr[left_x][up_y]
  count += 1 if arr[x][up_y]
  count += 1 if arr[right_x][up_y]
  count += 1 if arr[left_x][y]
  count += 1 if arr[right_x][y]
  count += 1 if arr[left_x][down_y]
  count += 1 if arr[x][down_y]
  count += 1 if arr[right_x][down_y]
  count
end

def iterate(arr)
  new_arr = []
  (0..(arr.size - 1)).each do |x|
    new_arr[x] = []
    (0..(arr.size - 1)).each do |y|
      n = num_neighbors x, y, arr
      if n == 3
        new_arr[x][y] = true
      elsif n == 2 && arr[x][y] == true
        new_arr[x][y] = true
      else
        new_arr[x][y] = false
      end
    end
  end
  new_arr
  
end

def create_arr(prng, size, percent)
  arr = []
  (0...size).each do |x|
    arr[x] = []
    (0...size).each do |y|
      arr[x][y] = prng.rand(101) <= percent
    end
  end
  arr
end

def print_arr(arr)
  (0...arr.size).each do |x|
    (0...arr.size).each do |y|
      arr[x][y] ? (print 'x') : (print '.')
     end
     puts
  end
  arr.size.times { print '*' }
  puts  
end

# EXECUTION STARTS HERE

raise "Enter integers for size, percentage (1..100), and number of iterations at command line" unless ARGV.count == 3
size, percent, iters = ARGV[0].to_i, ARGV[1].to_i, ARGV[2].to_i

raise "Enter valid size (>0) for size" unless size > 0
raise "Enter valid percentage (0 to 100) for percentage" unless percent >= 0 && percent <= 100
raise "Enter valid number of iterations (>= 0) for number of iterations" unless iters >= 0

prng = Random::new

arr = create_arr prng, size, percent
print_arr arr

(0..iters).each do
  print_arr arr
  arr = iterate arr
end
  
