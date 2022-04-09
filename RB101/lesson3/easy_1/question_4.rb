# The Ruby Array class has several methods for removing items from the array. 
# Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do 
# (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1)
numbers.delete(1)

first method removes the value AT index 1
second methid removes the value 1

