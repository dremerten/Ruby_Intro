# to load into irb use: require './variable_constant_scope.rb'

CONSTANT_OUT = 9 # outer constant

class TestClass
	attr_accessor :localVar, :iVar, :name, :email

	CONSTANT_CLASS = 10
	@@classVar = 11
	
	def initialize
		@iVar = 12  # initialized at creation of new class object	
	end

	def meth1   # will setup localVar and print out other values
		localVar = 13  
		puts @@classVar
		puts localVar
		puts iVar
	end

	# when this is called @localVar will not print because it doesn't exist outside of meth1
	def meth2
		puts @@classVar
		puts @iVar
		puts @localVar 
	end      

	# method explained on line 352
	def show_methods(klass)
  		puts Object.const_get(klass).methods.inspect
	end          
end

# a = TestClass.new
# a.meth1
# a.localVar = 5000
# a.meth2

# :: CONSTANT_OUT --- this says I want access from the overall object this constant. (outer constant)
# TestClass::CONSTANT_CLASS --- Says access the CONSTANT_CLASS within the TestClass.

=begin 
:: is basically a namespace resolution operator. It allows you to access items in modules, or class-level items in classes. 
For example, say you had this setup:

module SomeModule
    module InnerModule
        class MyClass
            CONSTANT = 4
        end
    end
end

You could access CONSTANT from outside the module as SomeModule::InnerModule::MyClass::CONSTANT.
It doesn't affect instance methods defined on a class, since you access those with a different syntax (the dot .).
Relevant note: If you want to go back to the top-level namespace, do this: ::SomeModule
=end

# inherits from TestClass
class User < TestClass
	class << self  # creates a CLASS METHOD, anytime 'self' wraps a method within a class it is a class method.
		def favorite_thing
			puts "Ruby!!!"
		end
	end

	def username(name)
		@name = name
		puts "Hey there #{name} nice to me you"
	end
end

#puts User.favorite_thing # returns the CLASS METHOD
#=> "Ruby!!!"

# inheirts from User
class Invoice < User
	# Class Method
	def self.print_out
		"Printed out invoice"
	end
	# Instance Method
	def convert_to_pdf
		"Converted documents to PDF"
	end
end

# return the class method
#Invoice.print_out #===> "Printed out invoice"

# return the instance method
# first create an instance of Invoice class
#customerA = Invoice.new

# call the instance method
#customerA.convert_to_pdf  #===> "Converted documents to PDF"


=begin
Ruby Inheritance

Ruby is the ideal object-oriented language. In an object-oriented programming language, inheritance is one of the most important features. 
Inheritance allows the programmer to inherit the characteristics of one class into another class. Ruby supports only single class inheritance,
it does not support multiple class inheritance but it supports mixins. 
The mixins are designed to implement multiple inheritances in Ruby, but it only inherits the interface part.

Inheritance provides the concept of “reusability”, i.e. If a programmer wants to create a new class and there is a class that already includes 
some of the code that programmer wants, then he or she can derive a new class from the existing class. By doing this, 
it increases the reuse of the fields and methods of the existing class without creating extra code.

Key terms in Inheritance:

	Super class:The class whose characteristics are inherited is known as a superclass or base class or parent class.
    Sub class:The class which is derived from another class is known as a subclass or derived class or child class. 
    You can also add its own objects, methods in addition to base class methods and objects etc.
Note: By default, every class in Ruby has a parent class. Before Ruby 1.9, Object class was the parent class of all the other classes 
or you can say it was the root of the class hierarchy. But from Ruby 1.9 version, 
BasicObject class is the super class(Parent class) of all other classes in Ruby. Object class is a child class of BasicObject class.

Syntax:

subclass_name < superclass_name

=end

# Example:

# Ruby program to demonstrate  
# the Inheritance 
  
#!/usr/bin/ruby  
  
# Super class or parent class 
class GeeksforGeeks  
  
    # constructor of super class 
    def initialize  
        puts "This is a Superclass initializer"
    end
      
    # method of the superclass 
    def super_method 
        puts "Method of a superclass"
    end
end
  # subclass or derived class  
class Sudo_Placement < GeeksforGeeks  
  
    # constructor of deriver class 
    def initialize  
  	puts "This is Subclass initializer"
    end
end
  
=begin
# creating object of superclass 
GeeksforGeeks.new
  
# creating object of subclass 
sub_obj = Sudo_Placement.new
  
# calling the method of superclass using sub class object 
sub_obj.super_method 

Output:
This is Superclass initializer
This is a Subclass initializer
Method of superclass

############################################################################################################################

Overrriding of Parent or Superclass method:

Method overriding is a very effective feature of Ruby. 
In method overriding, subclass and superclass contain the same method’s name(super_method), but performing different tasks or 
we can say that one method overrides another method. If superclass contains a method and subclass also contains the 
same method name then subclass method will get executed.

Example:
=end 

# Ruby program to demonstrate  
# Overrriding of Parent or Superclass method  
#!/usr/bin/ruby 
  
# parent class 
class Geeks 
      
    # method of the superclass   
    def super_method 
       puts "This is a Superclass Method" 
    end 
      
end 
  
# derived class 'Ruby'   
class Ruby < Geeks  
      
    # overriding the method of the superclass   
    def super_method 
        puts "Overriden by Subclass method" 
  end 
end 
   
=begin  
# creating object of sub class 
sub_obj = Ruby.new
  
# calling the method 
sub_obj.super_method   

Output:
Overriden by Subclass method

################################################################################################################################
Use of super Method in Inheritance: 

This method is used to call the parent class method in the child class. 
If the method does not contain any argument it automatically passes all its arguments. 
A super method is defined by super keyword. Whenever you want to call parent class method of the same name so you can simply 
write super or super().

Example:
=end


# Ruby Program to demonstrate the  
# use of super method 
#!/usr/bin/ruby 
  
# base class 
class Geeks_1 
    # method of superclass accpeting  
    # two parameter 
    def display a = 0, b = 0
        puts "Parent class, 1st Argument: #{a}, 2nd Argument: #{b}"
    end
end
  
# derived class Geeks_2 
class Geeks_2 < Geeks_1 
  
    # subclass method having the same name 
    # as superclass 
    def display a, b 
          
        # calling the superclass method 
        # by default it will PASS  
        # both the arguments 
        super
          
        # passing only one argument 
        super a 
          
        # passing both the argument 
        super a, b 
          
        # calling the superclass method 
        # by default it WILL NOT PASS  
        # both the arguments 
        super() 
          
        puts "Hey! This is subclass method"
    end
end
=begin
# creating object of derived class  
sub_obj = Geeks_2.new
  
# calling the method of subclass 
sub_obj.display "Sudo_Placement", "GFG"

Output:
Parent class, 1st Argument: Sudo_Placement, 2nd Argument: GFG    ---> super
Parent class, 1st Argument: Sudo_Placement, 2nd Argument: 0      ---> super a
Parent class, 1st Argument: Sudo_Placement, 2nd Argument: GFG    ---> super a, b
Parent class, 1st Argument: 0, 2nd Argument: 0                   ---? super()
Hey! This is subclass method

=end

##########################################
# A Deep Dive into the Ryby Object Model |
##########################################

=begin

*******************************************
** OBJECTS DON'T HAVE METHODS...CLASSES DO!| =======> VERY IMPORTANT TO UNDERSTAND !!!!!!!!!!!!!!
*******************************************

In Ruby, if you define a class and don't specifically inheirt from another class, by default the class will inheirt from the
"Object"(RubyClass) superclass. Everything inheirts from Basic object and Module respectively.

***************************************************************************************************

# A ruby Object written in C

strut = structure(think of it as the scafolding of an object)
iv = instance variable
st = symbol table
*m = method table
Value super = Reference to superclass(a superior class that ruby can inheirt from)
*const = Constants

strut RubyClass {
	struct RBasic basic;
	struct st_table *m_tbl;
	VALUE super;
	struct st_table *iv_index_tbl;
	struct st_table *iv_tbl;
	struct st_table *const_tbl;
};	

struct RBasic {
	VALUE flags;  # store info on object(is it frozen or tainted?)
	VALUE klass;  # Reference to whatever thec lass of the object is

};

############################################
Example of superclass |
-----------------------
# Integer is the superclass to Fixnum
# Fixnum inheirits from Interger SuperClass
Fixnum.superclass # => Integer

############################################

What is Klass?
----------------
class is a keyword used to define a new class. Since it's a reserved keyword, you're not able to use it as a variable name. 
You can't use any of Ruby's keywords as variable names, so you won't be able to have variables 
named def or module or if or end, etc - class is no different.

For example, consider the following:

def show_methods(class)
  puts Object.const_get(class).methods.inspect
end
show_methods "Kernel"

Trying to run this results in an error, since you can't use class as a variable name.

test.rb:1: syntax error, unexpected kCLASS, expecting ')'
    def show_methods(class)
                          ^
test.rb:2: syntax error, unexpected ')'
      puts Object.const_get(class).methods.inspect

To fix it, we'll use the identifier klass instead. It's not special, but it's conventionally used as a variable name 
when you're dealing with a class or class name. It's phonetically the same, but since it's not a reserved keyword, Ruby has no issues with it.

def show_methods(klass)
  puts Object.const_get(klass).methods.inspect
end

show_methods "Kernel"

Output, as expected, is
["method", "inspect", "name", "public_class_method", "chop!"...

You could use any (non-reserved) variable name there, but the community has taken to using klass. 
It doesn't have any special magic - it just means "I wanted to use the name 'class' here, but I can't, since it's a reserved keyword".
On a side note, since you've typed it out wrong a few times, it's worth noting that in Ruby, case matters. 
Tokens that start with a capital letter are constants. Via the Pickaxe:
A constant name starts with an uppercase letter followed by name characters. 
Class names and module names are constants, and follow the constant naming conventions. 
By convention, constant variables are normally spelled using uppercase letters and underscores throughout.
Thus, the correct spelling is class and klass, rather than Class and Klass. 
The latter would be constants, and both Class and Klass are valid constant names, but I would recommend against using them for clarity purposes.

##################################################################################################################################################
=end

=begin
###################
SINGLETON METHODS |
###################


# class method or instance method on User singleton class
# creates a singleton class
class User
	def self.status
		:hmm
	end

# instance method
# adds to current method table
	def status
		:admin
	end
end

#####################################################################
**********
MODULES  |
**********

Module:
	"Collections of methods and constants"

KEY DIFFERENCE FROM CLASSES:
	Similar to classes but without any instance creation capabillites.

EXAMPLE:  A Class superclass == Module

# Use a method as a collection of methods and constants

# create a module
module MyModule
	PI = 3.141591 # constant, which gets added to constant table
  
  # instance method
	def some_method
		puts "Hello, World"
	end
end

# access the module constant syntax
# gives access to module namespace
MyModule::PI  ==> 3.141592 (yay!)

# trying to call a method inside a module
MyModule.some_method  ==> NoMethodError (why?)

# you only access module instance methods if the module is included into a class

# to access the module instance method(from above)

# create a class that includes the module
class User
	include MyModule
end

# create a class instance
me = User.new

# Now call the module instance method
me.some_method ===> Hello, World

************************************************************


**************************
Variables in a Ruby Class|
**************************

Ruby provides four types of variables −

   Local Variables − Local variables are the variables that are defined in a method. 
   Local variables are not available outside the method. 
   Local variables begin with a lowercase letter or _.

   Instance Variables − Instance variables are available across methods for any particular instance or object. 
   That means that instance variables change from object to object. Instance variables are preceded 
   by the at sign (@) followed by the variable name.

   Class Variables − Class variables are available across different objects. A class variable belongs to 
   the class and is a characteristic of a class. They are preceded by the sign @@ and are followed by the variable name.

   Global Variables − Class variables are not available across classes. 
   If you want to have a single variable, which is available across classes, you need to define a global variable. 
   The global variables are always preceded by the dollar sign ($).

Example:

Using the class variable @@no_of_customers, you can determine the number of objects that are being created. 
This enables in deriving the number of customers.

class Customer
   @@no_of_customers = 0
end
***************************************************************

*************************************
Custom Method to Create Ruby Objects|
*************************************

You can pass parameters to method new and those parameters can be used to initialize class variables.
When you plan to declare the new method with parameters, you need to declare the method initialize at the 
time of the class creation.The initialize method is a special type of method, which will be executed when 
the new method of the class is called with parameters.

Here is the example to create initialize method −

class Customer
   @@no_of_customers = 0
   def initialize(id, name, addr)
      @cust_id = id
      @cust_name = name
      @cust_addr = addr
   end
end

In this example, you declare the initialize method with id, name, and addr as local variables. Here, def 
and end are used to define a Ruby method initialize. You will learn more about methods in subsequent chapters.
In the initialize method, you pass on the values of these local variables to the 
instance variables @cust_id, @cust_name, and @cust_addr. Here local variables hold the values that are 
passed along with the new method.

Now, you can create objects as follows −

cust1 = Customer.new("1", "John", "Wisdom Apartments, Ludhiya")
cust2 = Customer.new("2", "Poul", "New Empire road, Khandala")

#######################################################################################################################

**********************
Ruby Global Variables|
**********************


Global variables begin with $. Uninitialized global variables have the value nil and produce warnings with the -w option.
Assignment to global variables alters the global status. It is not recommended to use global variables. 
They make programs cryptic.

Here is an example showing the usage of global variable.

#!/usr/bin/ruby

$global_variable = 10
class Class1
   def print_global
      puts "Global variable in Class1 is #$global_variable"
   end
end
class Class2
   def print_global
      puts "Global variable in Class2 is #$global_variable"
   end
end

class1obj = Class1.new
class1obj.print_global
class2obj = Class2.new
class2obj.print_global

Here $global_variable is a global variable. This will produce the following result −

NOTE − In Ruby, you CAN access value of any variable or constant by putting a hash (#) character 
just before that variable or constant.

Global variable in Class1 is 10
Global variable in Class2 is 10
##########################################################################

************************
Ruby Instance Variables|
************************

Instance variables begin with @. Uninitialized instance variables have the value nil and produce warnings with the -w option.

Here is an example showing the usage of Instance Variables.

#!/usr/bin/ruby

class Customer
   def initialize(id, name, addr)
      @cust_id = id
      @cust_name = name
      @cust_addr = addr
   end
   def display_details()
      puts "Customer id #@cust_id"
      puts "Customer name #@cust_name"
      puts "Customer address #@cust_addr"
   end
end

# Create Objects
cust1 = Customer.new("1", "John", "Wisdom Apartments, Ludhiya")
cust2 = Customer.new("2", "Poul", "New Empire road, Khandala")

# Call Methods
cust1.display_details()
cust2.display_details()

Here, @cust_id, @cust_name and @cust_addr are instance variables. This will produce the following result −

Customer id 1
Customer name John
Customer address Wisdom Apartments, Ludhiya
Customer id 2
Customer name Poul
Customer address New Empire road, Khandala
######################################################################################

*********************
Ruby Class Variables|
*********************

Class variables begin with @@ and must be initialized before they can be used in method definitions.
Referencing an uninitialized class variable produces an error. Class variables are shared among descendants 
of the class or module in which the class variables are defined.
Overriding class variables produce warnings with the -w option.

Here is an example showing the usage of class variable −
#!/usr/bin/ruby

class Customer
   @@no_of_customers = 0
   def initialize(id, name, addr)
      @cust_id = id
      @cust_name = name
      @cust_addr = addr
   end
   def display_details()
      puts "Customer id #@cust_id"
      puts "Customer name #@cust_name"
      puts "Customer address #@cust_addr"
   end
   def total_no_of_customers()
      @@no_of_customers += 1
      puts "Total number of customers: #@@no_of_customers"
   end
end

# Create Objects
cust1 = Customer.new("1", "John", "Wisdom Apartments, Ludhiya")
cust2 = Customer.new("2", "Poul", "New Empire road, Khandala")

# Call Methods
cust1.total_no_of_customers()
cust2.total_no_of_customers()

Here @@no_of_customers is a class variable. This will produce the following result −

Total number of customers: 1
Total number of customers: 2
##########################################################################################

*********************
Ruby Local Variables|
*********************

Local variables begin with a lowercase letter or _. The scope of a local variable ranges from class, module, def, 
or do to the corresponding end or from a block's opening brace to its close brace {}.
When an uninitialized local variable is referenced, it is interpreted as a call to a method that has no arguments.
Assignment to uninitialized local variables also serves as variable declaration. 
The variables start to exist until the end of the current scope is reached. 
The lifetime of local variables is determined when Ruby parses the program.

In the above example, local variables are id, name and addr.

########################################################################################

***************
Ruby Constants|
***************

Constants begin with an uppercase letter. Constants defined within a class or module can be accessed 
from within that class or module, and those defined outside a class or module can be accessed globally.
Constants may not be defined within methods. Referencing an uninitialized constant produces an error. 
Making an assignment to a constant that is already initialized produces a warning.

class Example
   VAR1 = 100
   VAR2 = 200
   def show
      puts "Value of first Constant is #{VAR1}"
      puts "Value of second Constant is #{VAR2}"
   end
end

# Create Objects
object = Example.new()
object.show

Here VAR1 and VAR2 are constants. This will produce the following result −

Value of first Constant is 100
Value of second Constant is 200

##################################################################################################

**********************
Ruby Pseudo-Variables|
**********************

They are special variables that have the appearance of local variables but behave like constants. 
You cannot assign any value to these variables.

  self − The receiver object of the current method.
	true − Value representing true.
	false − Value representing false.
	nil − Value representing undefined.
	__FILE__ − The name of the current source file.
	__LINE__ − The current line number in the source file.

############################################################################################

********************
Ruby Basic Literals|
********************


The rules Ruby uses for literals are simple and intuitive. This section explains all basic Ruby Literals.
Integer Numbers.Ruby supports integer numbers. An integer number can range 
from -230 to 230-1 or -262 to 262-1. Integers within this range are objects of 
class Fixnum and integers outside this range are stored in objects of class Bignum.

You write integers using an optional leading sign, 
an optional base indicator (0 for octal, 0x for hex, or 0b for binary), followed by a string of digits in the appropriate base. 
Underscore characters are ignored in the digit string.

You can also get the integer value, corresponding to an ASCII character or escape the sequence 
by preceding it with a question mark.
Example

123                  # Fixnum decimal
1_234                # Fixnum decimal with underline
-500                 # Negative Fixnum
0377                 # octal
0xff                 # hexadecimal
0b1011               # binary
?a                   # character code for 'a'
?\n                  # code for a newline (0x0a)
12345678901234567890 # Bignum


Ruby supports floating numbers. They are also numbers but with decimals. Floating-point numbers are objects of class Float and can be any of the following −
Example

123.4                # floating point value
1.0e6                # scientific notation
4E20                 # dot not required
4e+20                # sign before exponential

String Literals

Ruby strings are simply sequences of 8-bit bytes and they are objects of class String. Double-quoted strings allow substitution 
and backslash notation but single-quoted strings don't allow substitution and allow backslash notation only for \\ and \'
Example

#!/usr/bin/ruby -w

puts 'escape using "\\"';
puts 'That\'s right';

This will produce the following result −

escape using "\"
That's right

You can substitute the value of any Ruby expression into a string using the sequence #{ expr }. Here, expr could be any ruby expression.


#!/usr/bin/ruby -w

puts "Multiplication Value : #{24*60*60}";

This will produce the following result −

Multiplication Value : 86400

Backslash Notations

Following is the list of Backslash notations supported by Ruby −
Notation 	Character represented
\n 	Newline (0x0a)
\r 	Carriage return (0x0d)
\f 	Formfeed (0x0c)
\b 	Backspace (0x08)
\a 	Bell (0x07)
\e 	Escape (0x1b)
\s 	Space (0x20)
\nnn 	Octal notation (n being 0-7)
\xnn 	Hexadecimal notation (n being 0-9, a-f, or A-F)
\cx, \C-x 	Control-x
\M-x 	Meta-x (c | 0x80)
\M-\C-x 	Meta-Control-x
\x 	Character x

Literals of Ruby Array are created by placing a comma-separated series of object references between the square brackets. A trailing comma is ignored.
Example

#!/usr/bin/ruby

ary = [  "fred", 10, 3.14, "This is a string", "last element", ]
ary.each do |i|
   puts i
end

This will produce the following result −

fred
10
3.14
This is a string
last element

A literal Ruby Hash is created by placing a list of key/value pairs between braces, with either a comma or the sequence => between the key and the value. 
A trailing comma is ignored.

Example

#!/usr/bin/ruby

hsh = colors = { "red" => 0xf00, "green" => 0x0f0, "blue" => 0x00f }
hsh.each do |key, value|
   print key, " is ", value, "\n"
end

This will produce the following result −

red is 3840
green is 240
blue is 15

A Range represents an interval which is a set of values with a start and an end. Ranges may be constructed using the s..e and s...e literals, or with Range.new.
Ranges constructed using .. run from the start to the end inclusively. Those created using ... exclude the end value. When used as an iterator, 
ranges return each value in the sequence.

A range (1..5) means it includes 1, 2, 3, 4, 5 values and a range (1...5) means it includes 1, 2, 3, 4 values.
Example

#!/usr/bin/ruby

(10..15).each do |n| 
   print n, ' ' 
end

This will produce the following result −

10 11 12 13 14 15

################################################################################

****
Nil| 
****

A Formal Introduction

What happens if you try to access a key that doesn’t exist, though?
In many languages, you’ll get an error of some kind. Not so in Ruby: you’ll instead get the special value nil.
Along with false, nil is one of two non-true values in Ruby. (Every other object is regarded as “truthy,” meaning that 
if you were to type if 2 or if "bacon", the code in that if statement would be run.)
It’s important to realize that false and nil are not the same thing: false means “not true,” while nil is Ruby’s way of saying “nothing at all.”

##########################################################################################

********
Symbols|
********

What's a Symbol?
You can think of a Ruby symbol as a sort of name. It’s important to remember that symbols aren’t strings:

"string" == :string # false

Above and beyond the different syntax, there’s a key behavior of symbols that makes them different from strings. 
While there can be multiple different strings that all have the same value, there’s only one copy of any particular symbol at a given time.

The .object_id method gets the ID of an object—it’s how Ruby knows whether two objects are the exact same object. 
see that the two "strings" are actually different objects, whereas the :symbol is the same object listed twice.

puts "string".object_id
puts "string".object_id

puts :symbol.object_id
puts :symbol.object_id

What are Symbols Used For?

Symbols pop up in a lot of places in Ruby, but they’re primarily used either as hash keys or for referencing method names. 

sounds = {
  :cat => "meow",
  :dog => "woof",
  :computer => 10010110,
}

Symbols make good hash keys for a few reasons:

    They’re immutable, meaning they can’t be changed once they’re created;
    Only one copy of any symbol exists at a given time, so they save memory;
    Symbol-as-keys are faster than strings-as-keys because of the above two reasons.

Converting Between Symbols and Strings

Converting between strings and symbols is a snap.

:sasquatch.to_s
# ==> "sasquatch"

"sasquatch".to_sym
# ==> :sasquatch

The .to_s and .to_sym methods are what you’re looking for!

Remember, there are always many ways of accomplishing something in Ruby. Converting strings to symbols is no different!
Besides using .to_sym, you can also use .intern. This will internalize the string into a symbol and works just like .to_sym:

"hello".intern
# ==> :hello

When you’re looking at someone else’s code, you might see .to_sym or .intern (or both!) when converting strings to symbols.
However, the hash syntax changed in Ruby 1.9. Just when you were getting comfortable!

The good news is that the changed syntax is easier to type than the old hash rocket syntax, and if you’re used to JavaScript objects or Python dictionaries, it will look very familiar:

new_hash = { 
  one: 1,
  two: 2,
  three: 3
}```

The two changes are:

1. You put the colon at the end of the symbol, not at the beginning;
2. You don't need the hash rocket anymore.

It's important to note that even though these keys have colons at the end instead of the beginning, they're still symbols!

```rb
puts new_hash
# => { :one => 1, :two => 2, :three => 3 }

From now on, we’ll use the 1.9 hash syntax when giving examples or providing default code. 
You’ll want to be familiar with the hash rocket style when reading other people’s code, which might be older.


Dare to Compare

We mentioned that hash lookup is faster with symbol keys than with string keys. Here, we’ll prove it!
The code in the editor uses some new syntax, so don’t worry about understanding all of it just yet. 
It builds two alphabet hashes: one that pairs string letters with their place in the alphabet ( “a” with 1, “b” with 2…) 
and one that uses symbols (:a with 1, :b with 2…). We’ll look up the letter “r” 100,000 times to see which process runs faster!
It’s good to keep in mind that the numbers you’ll see are only fractions of a second apart, and we did the hash lookup 100,000 times each. 
It’s not much of a performance increase to use symbols in this case, but it’s definitely there!


require 'benchmark'

string_AZ = Hash[("a".."z").to_a.zip((1..26).to_a)]
symbol_AZ = Hash[(:a..:z).to_a.zip((1..26).to_a)]

string_time = Benchmark.realtime do
  200_000_000.times { string_AZ["r"] }
end

symbol_time = Benchmark.realtime do
  200_000_000.times { symbol_AZ[:r] }
end

puts "String time: #{string_time} seconds."
puts "Symbol time: #{symbol_time} seconds."

require 'benchmark'

count = 100000000

Benchmark.bm do |bm|
  bm.report('Symbol:') do
    count.times { :symbol.hash }
  end
  bm.report('String:') do
    count.times { "string".hash }
  end
end

#######################################################################################################################################


We know how to grab a specific value from a hash by specifying the associated key, but what if we want to filter a hash 
for values that meet certain criteria? For that, we can use .select.

grades = { alice: 100,
  bob: 92,
  chris: 95,
  dave: 97
}

grades.select { |name, grade| grade <  97 }
# ==> { :bob => 92, :chris => 95 }

grades.select { |k, v| k == :alice }
# ==> { :alice => 100 }

    In the example above, we first create a grades hash that maps symbols to integers.
    Then we call the .select method and pass in a block of code. The block contains an expression for selecting matching key/value pairs. 
    It returns a hash containing :bob and :chris.
    Finally, we call the .select method again. Our block looks only for the key :alice. 
    This is an inefficient method of getting a key/value pair, but it shows that .select does not modify the hash.

(Here we’re using “name” or “k” to stand for the key and “grade” or “v” to stand for the value, but as usual with blocks, you can call your variables whatever you like.)

More Methods, More Solutions

We’ve often found we only want the key or value associated with a key/value pair, and it’s kind of a pain to put both 
into our block and only work with one. Can we iterate over just keys or just values?

Ruby includes two hash methods, .each_key and .each_value, that do exactly what you’d expect:

my_hash = { one: 1, two: 2, three: 3 }

my_hash.each_key { |k| print k, " " }
# ==> one two three

my_hash.each_value { |v| print v, " " }
# ==> 1 2 3

Let’s wrap up our study of Ruby hashes and symbols by testing these methods out.

=end


