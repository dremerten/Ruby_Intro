# to load into irb use: require './variable_constant_scope.rb'

CONSTANT_OUT = 9 # outer constant

class TestClass
	attr_accessor :localVar, :iVar, :name

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
#############################


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


