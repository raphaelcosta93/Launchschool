def retained_array
  arr = []
  Proc.new do |el|
    arr << el
    arr
  end
end

arr = retained_array
arr.call('one')
arr.call('two')
p arr.call('three')

p arr.class