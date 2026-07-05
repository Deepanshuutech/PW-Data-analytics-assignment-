#PW BASIC ASSIGNMENT 

#Q2 Explain the difference between list and tuple.

# List

my_list = [10, 20, 30]
my_list.append(40)

print("List:", my_list)

# Tuple
my_tuple = (10, 20, 30)

print("Tuple:", my_tuple)

#Q3 What is function in python? why are functions useful?

def greet() -> None:
    print("Welcome to Python!")

greet()

#Q4 Write a python program to take a user's name as input and print a greeting message.

name = input("Enter your name: ")

print("Hello,", name + "! Welcome to Python.")

#Q5 Write a python program to check whether a number is even or odd.

number = int(input("Enter a number: "))

if number % 2 == 0:
    print(number, "is an even number.")
else:
    print(number, "is an odd number.")


#6 Write a program to print numbers fromt 1 to 10 using a loop.

for i in range(1, 11):
    print(i)    

#Q7. Create a list of five numbers and print the maximum number.

numbers = [15, 8, 42, 25, 10]

print("Maximum number is:", max(numbers))

#Q8. Remove duplicate values from a list using a set.

numbers = [2, 3, 4, 2, 5, 2, 4, 3]

unique_numbers = list(set(numbers))

print("Original List:", numbers)
print("Without Duplicates:", unique_numbers)

#Q9. Write a function that returns the square of a number.

def square(num):
    return num * num

number = int(input("Enter a number: "))

print("Square is:", square(number))

#Q10. Count how many times a number appears in a list.

numbers = [2, 3, 4, 2, 5, 2]

search = int(input("Enter the number to count: "))

count = numbers.count(search)

print(search, "appears", count, "times.")