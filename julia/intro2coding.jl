### A Pluto.jl notebook ###
# v0.19.42

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 3b2b0c4a-83b0-41ea-9654-b6a11e22d0d2
using ImageCore

# ╔═╡ ca980f8f-10f1-45b4-ad4a-2b445059591e
using Colors

# ╔═╡ 6e694ce6-a3ad-4947-869b-eba8e595ad63
using PythonCall, CondaPkg

# ╔═╡ 3535775c-2d63-4c92-8c22-8f47b9e2b294
using PlutoUI, CommonMark

# ╔═╡ 9c238f5b-3981-4aef-be52-b50e5b832b69
md"""
# Intro to Coding 🌳
This tutorial is adapted from the fantastic [Python course by Sara Blunt (2021)](https://colab.research.google.com/drive/1k7kQRZtGSX-s8OKXuwCvluNCO7iNvZnJ?usp=sharing) and will take you through some foundational programming operations, from the perspective of a research astronomer 🌠. It aims to provide a bit of background on how computers interpret code, while at the same time showing you what you need to type in order to make things work.

We absolutely encourage you to look up other intro programming tutorials on the internet (e.g. <https://www.learnpython.org/>)! There are some excellent free resources out there. For a modern, STEM oriented programming language (which this notebook is written in!), check out MIT's [Computational Thinking](https://computationalthinking.mit.edu/) course.

The main part of this lesson is designed to take 1 hour, and to be executed independently while an instructor walks around to answer questions and give hints.

The mini-projects at the very end are open-ended, and may take between 10 mins and a few hours each. The idea is to pick one (or a few) to work on, rather than aiming to complete all of them.

By the end of this tutorial, you will be able to:
* Use comments, variables, functions, conditionals, loops, and imports to write code.
* Identify objects of type `String`, `Float`, `Integer`, `Function`, and `Bool`, and know ways to check.
* Explain the three main steps a computer executes while running code, and analyze the current state of the local environment after each line is parsed.

Throughout this notebook, we will show Julia code highlighted along with equivalent Python code. For example, here is one way we might generate a 3 x 4 matrix of random integers from 1 to 10 (inclusive) in both languages:
"""

# ╔═╡ 242303ed-bf92-4563-a5b9-3b4d4554dfdd
rand(1:10, 3, 4)

# ╔═╡ 0e347ed0-b0df-4b81-9565-1410a74543f7
md"""
!!! tip "Python 🐍"
	
	```python
	import numpy as np
	np.random.randint(1, 11, size=(3, 4))
	```

	```python
	array([[3, 1, 2, 6],
	       [1, 3, 7, 3],
	       [8, 1, 9, 9]])
	```
"""

# ╔═╡ 5cd392a4-5804-4748-9016-9b6baa73a85a
md"""
With this requisite information out of the way, let's get started!
"""

# ╔═╡ ba40cbc9-363e-4dfe-98ac-28672e9864bf
msg_adding_colors = md"""
##### Adding colors in Julia 🎨
This makes magenta!

```julia
using ImageCore

RGB(1, 0, 0) + RGB(0, 0, 1)
```

$(RGB(1, 0, 0) + RGB(0, 0, 1))
""";

# ╔═╡ 400ca605-6e11-492d-ad5c-ffade9cf3941
md"""
## Comments #️⃣

In coding/programming, comments are lines starting with one or more special characters, and are not run. In Julia, these are `#` for single line comments or `#=` `=#` wrapped around multi-line comments, like an open and close parenthesis. In Python, the equivalents are `#` and `\"""`. The computer treats them as if they don't exist! 
"""

# ╔═╡ 11e3ad1e-588c-4d37-aa49-2d6d996c2900
# Try running this cell (by pressing `shift-enter` or selecting the play button
# below this cell); nothing will be displayed.

# ╔═╡ 2e063e4b-595a-4b54-84e8-9250d9d2b521
md"""
Why do you think we have comments if they do not cause the computer to do anything?

🟢 Your thoughts here:
"""

# ╔═╡ 3378e493-067c-4387-bf02-d645317c8f56


# ╔═╡ 1a6c18a7-5863-4052-b823-ad26498dfa13
md"""
## 💻 Your First Line of Code!

What do you think will happen when you run the following line of code?
"""

# ╔═╡ 5cb30b47-15ea-461c-b59d-900fda3651d0
# Uncomment to run
# println("Hello friend")

# ╔═╡ 9b57c6ec-56e5-4658-b5c5-72b4cff06be1
md"""
!!! tip "Python 🐍"

	```python
	print("Hello friend")
	# Hello friend 
	```
"""

# ╔═╡ 24712474-2d6f-4854-a335-ab0a3719b750
md"""
Try printing out your own message below:
"""

# ╔═╡ 8c5cf9ce-100a-4a80-aa82-91896960f480


# ╔═╡ 27bc4e6c-d34f-4fbf-bab0-38c56cf725ab
md"""
!!! note "print vs. println"

	This distinction just comes down to how [newlines](https://en.wikipedia.org/wiki/Newline) are handled; in other words how blank lines are printed out. In Python, this is handled with a [keyword argument](https://en.wikipedia.org/wiki/Named_parameter). In Julia, it is its own function.
"""

# ╔═╡ 5d765ca0-83f6-4a8d-a551-b272f13b179f
println("First line"); print("Second line")

# ╔═╡ 17d49c7c-eb65-498f-891f-71fcf5e64134
md"""
!!! tip "Python 🐍"

	```python
	print("First line"); print("Second line")
	```

	```python
	First line
	Second line
	```
"""

# ╔═╡ c7828d38-e50d-46d7-9d20-369ccdd4a9ee
print("First line. "); print("Still first line")

# ╔═╡ 0617b99b-f93e-4ef5-bc42-b5b48d7bf2ce
md"""
!!! tip "Python 🐍"

	```python
	print("First line. ", end=""); print("Still first line")
	```

	```
	First line. Still first line
	```
""" 

# ╔═╡ 0b705ce9-7100-40cf-b12d-689c6720be80
md"""
We'll learn more about keyword arguments when we get to the [Functions](#functions) section.
"""

# ╔═╡ 98944a79-cead-4110-9fb1-78600b47b2d6
md"""
## Variables

What's the difference between:

```julia
println("hello")
```

and

```julia
println(hello)
```

!!! tip "Python 🐍"
	```python
	print(hello)
	```

What happens when you try running it?
"""

# ╔═╡ 4bf8f465-7695-4366-ad89-8bbad88f7a68
print(hello)

# ╔═╡ 3c1f53ed-baea-4efc-8108-928ce31ae041
md"""
We've encountered our first error 😱! These can be frustrating when you are starting out, but they are eventually very helpful. They tell you that **A)** something is wrong with your code, and **B)** give you clues as to where and why something went wrong.

In this case, the error message is telling us that the variable `hello` is not defined, i.e. `UndefVarError`. So it looks like we should define it!

Let's take a look at how variables work (hint: it's similar to how they work in math!). In the code below, `foo`, `bar`, and `foobar` are all **variables**:

```julia
foo = 1
bar = 2

foobar = 1 + 2

println(foobar)
println(typeof(foobar))

foobar = "hello!"

println(foobar)
println(typeof(foobar))
```

!!! tip "Python 🐍"
	```python
	foo = 1
	bar = 2
	
	foobar = 1 + 2
	
	print(foobar)
	print(type(foobar))
	
	foobar = "hello!"
	
	print(foobar)
	print(type(foobar))
	```

Before you run this cell, write down below what you expect it to print out.

🟢 Your thoughts here:
"""

# ╔═╡ f60aa8a4-6dfd-40be-bf00-e1072689db40


# ╔═╡ 58673c8e-a333-4c96-928a-5305ffdce8c7
md"""
Run cell: $(@bind run_variables_cell CheckBox())
"""

# ╔═╡ 4397fe2c-04aa-4bec-bf4e-cbcdee0baed2
if run_variables_cell
	let
		foo = 1
		bar = 2
		
		foobar = 1 + 2
		
		println(foobar)
		println(typeof(foobar))
		
		foobar = "hello!"
		
		println(foobar)
		println(typeof(foobar))
	end
end

# ╔═╡ 15c35bcd-6995-4b61-84a0-a9763dd2d305
md"""
With this in mind, how could we modify

```julia
print(hello)
```

so that it prints the desired output: `"hello"`
"""

# ╔═╡ 017298fe-3a8f-415d-b712-134397c08256


# ╔═╡ c3aeacff-cf94-4422-be59-8de51d57f373
md"""
!!! hint "Possible solution"
	
	```julia
	salutation = "hello"
	println(salutation)

	# hello
	```
"""

# ╔═╡ 99738d51-2f8e-4e91-88bc-d3b8f5329dd4
md"""
## Types
There are many different kinds of variables, which we call **types**. These physically live on your computer and are stored/interpreted in different ways (think 1s and 0s). Here are a few examples of some important types:


```julia
"hello" # type "String"
13      # type "Int64" (short for "Integer")
13.4    # type "Float64"
```

!!!  tip "Python 🐍"
	```python
	"hello" # type "str" (short for "string")
	13      # type "int" (short for "integer")
	13.4    # type "float"
	```

We can use the `typeof` function (`type` in Python) to display the types of each of these:
"""

# ╔═╡ fe340371-d8e2-4b1a-8b45-d1435cc98a62
begin
	println(typeof("hello"))
	println(typeof(13))
	println(typeof(13.4))
end

# ╔═╡ 2e646d7c-9be2-40b2-b07d-bb9214a3c8c1
md"""
!!!  tip "Python 🐍"
	```python
	print(type("hello"))
	print(type(13))
	print(type(13.4))
	```
"""

# ╔═╡ e3655b35-4bb9-42ad-a1a8-23549efd519a
md"""
What would you guess are the types of the following? Use the `typeof` function to check!

```julia
"hi there!" # 1
13.         # 2
13 + 14     # 3
```
"""

# ╔═╡ 69b69d34-f4e7-4c98-875d-7d80ed487c26
md"""
🟢 Your thoughts here:


"""

# ╔═╡ 8f1cae48-bb0e-466c-94d7-b79a6e18b497
with_terminal() do
# Scratch space for your code
end

# ╔═╡ d6d039cf-beea-49cf-83dd-96542e08ee4a
md"""
## Functions

You've actually already encountered a fourth type: functions!
"""

# ╔═╡ f0dc721a-45fa-45e1-a31d-6dac6ff96d99
println isa Function

# ╔═╡ bc6ec879-d744-4d04-ab47-a383b69404d1
md"""
!!!  tip "Python 🐍"
	```python
	import types
	isinstance(print, types.BuiltinFunctionType)
	```
"""

# ╔═╡ 000cbb49-8dbf-4f3b-bca4-9825890e442a
md"""
Functions operate very similarly to how they do in math. Let's define our own function to see how they work:
"""

# ╔═╡ 1cfc3faf-81ed-40a8-bb42-d6dfc9f791a1
# This defines how the function works
function my_function()
	println("hello!")
end

# ╔═╡ d3da42a6-1392-47dc-b470-be04ae82390f
md"""
!!!  tip "Python 🐍"
	```python
	def my_function():
		print("hello!")
	```
"""

# ╔═╡ 84224027-e070-4c9d-8a61-87d2f37c215e
# This runs the function
my_function()

# ╔═╡ 284b2544-9582-4adb-8bd7-186f55fce6f7
md"""
What do you think would happen if we didn't run the function (i.e. removed the line above?)
"""

# ╔═╡ 181f6657-bea2-4907-9372-a821a79b9b6e
md"""
!!! tip
	Another way to define functions in Julia is like this:
	```julia
	my_function() = println("hello!")
	```
"""

# ╔═╡ ff6f9fed-0b2a-44be-abef-3e61f0764fb8
md"""
You can also write functions that use **arguments**. Here's an example:
"""

# ╔═╡ 000d55b8-ed16-4a22-aac7-f1acbb7a34da
my_function_with_args(first_arg, second_arg) = println(first_arg * second_arg)

# ╔═╡ eb3b0a5a-aa98-4a92-b0c4-bd2ba5a82f0c
md"""
!!!  tip "Python 🐍"
	```python
	def my_function_with_args(first_arg, second_arg):
		print(first_arg + second_arg)
	```
"""

# ╔═╡ 71ac570e-8dc5-4264-8a2a-3a213f81e962
md"""
Figure out how to run this function on two `Int`s. What do you think will happen if you try to run it on two `String`s?
"""

# ╔═╡ f5dc6525-5ddc-4e48-8144-9413b2272c27
with_terminal() do
	## your code here: ##

	#####################
end

# ╔═╡ a4097197-b224-4002-8408-4374258a4a45
md"""
One last thing to know about functions: they can also `return` something. Here's an example:
"""

# ╔═╡ 285d58f4-b42c-45fb-a741-767022f56f69
function my_returning_function(arg1, arg2)
	intermediate_variable = arg1 + arg2
	return intermediate_variable
end

# ╔═╡ b720baa8-143c-488f-b297-29ca987b3a51
md"""
!!!  tip "Python 🐍"
	```python
	def my_returning_function(arg1, arg2):
		intermediate_variable = arg1 + arg2
		return intermediate_variable
	```
"""

# ╔═╡ 69ba8980-e0bd-4d6b-b881-378bebcade04
# Run the function
foo = my_returning_function(1, 2)

# ╔═╡ 59d0886f-b328-4081-abe0-503ac9d11266
md"""
If trying this in Python, why didn't running this cell do anything? How could you get Python to tell you what `foo` is (like Julia does by default)?
"""

# ╔═╡ 5ae296b7-81f2-4328-94d7-576bcfb5a8a2
md"""
🟢 Your thoughts here:


"""

# ╔═╡ cb11a2ae-5cb6-41e6-8032-946f7526fe01
with_terminal() do
# Scratch space for your code
end

# ╔═╡ ea2203a9-922c-4183-a78d-540ee7a87467
md"""
## 👓 How Computers Read Code

At this point, you know enough code to start learning about how computers read it. This concept isn't generally taught in intro programming tutorials, but I think it's invalauble for debugging (finding errors), writing fast code, and a whole host of other things. Here is a nice overview of these concepts from the CrashCourse YouTube series:
"""

# ╔═╡ 91493fcc-4cb0-4532-ad57-c4e1dae4ddce
html"""
<iframe width="100%" height="315" src="https://www.youtube.com/embed/RU1u-js7db8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
"""

# ╔═╡ beb7f1d0-b337-4137-a131-bd0e9c2c1200
md"""
To briefly summarize, there are three main steps in the process of a computer running some code: parsing, compiling, and executing.

**Parsing** is the process of translating the code to units that the computer can understand. You can think of parsing as populating an "environment" (list) of currently defined variables and using this to translate later lines.

!!! danger "Disclaimer"
	This is pretty simplified! The boundary between parsing and compiling is pretty blurry, so these exact
	definitions may change depending on what language you're using. 

**Example 1:**
"""

# ╔═╡ 446a31b4-f0ad-43d7-a611-3470815b840a
begin
	var1 = "hello "
	var2 = "there!"
	newvar = var1 * var2
end

# ╔═╡ 6c059624-7167-4721-b973-d3a34f035b32
md"""
!!!  tip "Python 🐍"
	```python
	var1 = "hello "
	var2 = "there!"
	newvar = var1 + var2
	```
"""

# ╔═╡ b43cde6e-dac3-4e8f-8e32-a43812ed2a5a
md"""
After parsing the first line, the environment looks like:

```
var1 -> "hello " (type String)
```

After parsing the second line, the environment looks like:

```
var1 -> "hello " (type String)
var2 -> "there!" (type String)
```

After parsing the third line, the environment looks like:

```
var1 -> "hello " (type String)
var2 -> "there!" (type String)
newvar -> output of function "*" acting on "hello " and "there!" (type String)
```
"""

# ╔═╡ bf2fbeaf-23d8-48b7-bfbc-f257d8539412
md"""
**Example 2:**

Try doing this yourself with the following code:

```julia
myvar = 3.5

function my_new_function()
  return "what's up?"
end

anothervar = my_new_function()
```

!!!  tip "Python 🐍"
	```python
	myvar = 3.5
	
	def my_new_function():
	  return "what's up?"
	
	anothervar = my_new_function()
	```

After parsing the first line, the environment looks like:
"""

# ╔═╡ cd8b6d99-8570-4c69-a8cc-59c9be07a3fa
md"""
🟢 Your thoughts here:


"""

# ╔═╡ ca1a3229-5b89-4038-812f-d896f3affd0a
md"""
After parsing the second & third lines, the environment looks like:
"""

# ╔═╡ 5dd05f46-d7ee-4a24-84b0-8fa1e0b168cb
md"""
🟢 Your thoughts here:


"""

# ╔═╡ ddb3498b-fd63-46d4-855f-ce13ba494811
md"""
After parsing the fourth line, the environment looks like:
"""

# ╔═╡ ff0b17c6-a91c-4640-9cdb-da69a351c9e3
md"""
🟢 Your thoughts here:


"""

# ╔═╡ bc746e9f-02fa-42f2-8a0d-4243d3e63918
md"""
The second step, **compiling**, involves translating the parsed code into machine-readable code. In Python, this is a several step process involving translating to C, then compiling the C code into machine-readable code (think 1s and 0s again). In Julia, the process is significantly streamlined, allowing for a [more direct route](https://docs.julialang.org/en/v1/manual/faq/#Why-don't-you-compile-Matlab/Python/R/%E2%80%A6-code-to-Julia?) from "human language" to optimized "machine language". In other words, Julia gives the compiler more chances to do what it does best!

The last step is actually running the machine-readable code and returning the answer to you! This is often called **execution**.

After compilation and execution, the environment from our first example looks like this:

```
var1 -> "hello " (type String)
var2 -> "there!" (type String)
newvar -> "hello there!" (type String)
```

What does the environment from the second example look like after execution?
"""

# ╔═╡ 17dee10b-24c4-44ac-b8dc-f2689d38700c
md"""
🟢 Your thoughts here:


"""

# ╔═╡ 886b45e5-6d18-49bd-9765-e4d14e4eb9d4
md"""
## ➰ Conditionals and Loops

Using a conditional tells your computer "do this ONLY IF this other thing is true". Let's take a look at how they work:
"""

# ╔═╡ 7f577e74-0030-4e6d-ba1d-dc931bd2566a
with_terminal() do
	a = 1 # One equals sign to define a variable
	
	if a == 1 # Two equals signs to check truth value
		println("yay!")
	else
		println("noooo")
	end
end

# ╔═╡ dcf61c03-7d33-413e-a994-59de55b79ca0
md"""
!!!  tip "Python 🐍"
	```python
	a = 1
	
	if a == 1:
		print("yay!")
	else:
		print("noooo")
	```
"""

# ╔═╡ 453d7a14-f85d-4a9a-a2a9-ec385be3a87e
md"""
What's happening under the hood in the code above? This involves a new type-- `Bool` (short for Boolean, i.e. True or False). First, the code `a == 1` is translated to a Boolean value (in this case, True). The conditional `if` just means "execute this code is this next statement is True," so we enter the first `println` statement.

Play around with the code above: 

- What happens if you replace `a == 1` with True? 
- What happens if you define `a = 2` instead of `a = 1`?

Let's take a look at another important structure in pretty much every coding language I know of)-- the `for` loop.

Here's what a `for` loop looks like:

```julia
for i in [0, 1, 2, 3]
	println(i)
end
```

!!!  tip "Python 🐍"
	```python
	for i in [0, 1, 2, 3]:
		print(i)
	```

What do you think will happen? Run the cell and see if you're right!

Run cell: $(@bind run_loop_cell CheckBox())
"""

# ╔═╡ 85460bab-f096-45a5-a020-285fea1901b7
if run_loop_cell
	with_terminal() do
		for i in [0,1,2,3]
			println(i)
		end
	end
end

# ╔═╡ a2685d04-459b-4919-aa70-6e350e6a0571
md"""
**Exercise:** write some code that prints out:

```
"<<name>> is awesome!"
```

for each person in the list `["Sarah", "Jason", "BJ"]` if the person's name has more than 3 letters (sorry, BJ). Google how to use Julia's `length` function (Python's `len` function) to help you!
"""

# ╔═╡ 6d8f33b7-dcba-42eb-8966-887a5fb3a535
with_terminal() do
	## your code here: ##

	
	#####################
end

# ╔═╡ 908f0673-ee21-4771-b572-58c9bc9cfea2
md"""
## ⬇️ Imports

The last thing I'd like to introduce is imports. Python's popularity is due (in no small part!) to its extensive collection of useful code written by people other than the primary developers. These collections of code are called "packages" or "libraries." You can use packages by importing them. Similarly, the Julia [ecosystem](https://julialang.org/community/#julia_github_orgs) of packages is very rich, actively developed, and [composable](https://youtu.be/kc9HwsxE1OY?t=162) (Physics example at 2:42).

Let's look at an example in Python: 

!!!  tip "Python 🐍"
	```python
	import numpy as np
	
	print(np.arange(10))
	```

In the two lines above, we've imported a package (numpy), told our computer that we want to call this package `np` (instead of the more unweidly "numpy"), then used the function `arange` from numpy, which prints out all whole numbers smaller than the input number. Notice that we can't use `arange` alone, we have to use `np.arange` to tell the computer that this function comes from numpy.

Julia has the advantage of being built from the ground up with scientific computing in mind, so this is already baked into the language:
"""

# ╔═╡ bc13de91-da69-467b-ba54-d2891791e77d
collect(1:10)

# ╔═╡ 7ec3b70d-4f17-4534-bb10-98674b783239
md"""
!!! note
	As you may have noticed, Julia is also 1-based indexed. This seems to be a point of contention for a lot of people for some reason, but it [doesn't have to be](https://github.com/giordano/StarWarsArrays.jl). You can use whatever base makes you happy.
"""

# ╔═╡ c61ef8ae-a8ee-48fd-bd3b-8c21912b5c2b
md"""
Importing packages also follow a similar syntax to Python. Unlike Python though, we can also import packages without needing to qualify them with a package name alias like `np`. For example, take the built-in function `range`:
"""

# ╔═╡ 7c66b494-b755-47b8-bdac-969d539a24e5
range

# ╔═╡ 76593ae0-a878-43e2-b207-ac77641b2045
md"""
!!! tip
	Select the "Live docs" tab after clicking on `range` to pull up its documentation
"""

# ╔═╡ 515ebad0-a335-4cb3-9ed8-37a2dc3c7042
md"""
Based on the documentation, we see that it can produce an array of numbers, similarly to numpy's `arange` or `linspace` functions. Now, what if we wanted to extend this to work with "color inputs" as well, while still using the same function name: `range`? This is known as [multiple dispatch](https://www.oxinabox.net/2020/02/09/whycompositionaljulia.html), and it has many deep, far-reaching, and emergent benefits. Let's try it out by using the `Colors.jl` package 🌈:
"""

# ╔═╡ cfbd1f1e-af46-48a0-8a4b-25b7cd538a2e
range(colorant"blue", colorant"red")

# ╔═╡ 542052e5-2cf4-485a-b9fe-153a14a24cab
md"""
Without needing to edit the source code of the "base" version of `range`, we were able to seamlessly extend its functionality by `using` a separate package, which was also automatically downloaded and installed for us thanks to the nice people behind `Pluto.jl` 🍉
"""

# ╔═╡ 13e830da-f5c0-4746-ae26-c7ed5c1647fb
md"""
### Interoperability aside

We also don't need to choose between using one language over the other. With [PythonCall.jl](https://github.com/JuliaPy/PythonCall.jl), we can write Python code as-is:
"""

# ╔═╡ 55b6933b-4a43-4cc0-82cb-f0ba0fcd848f
CondaPkg.add("numpy")

# ╔═╡ 3fc8a3d3-a0c8-4fff-8bac-b2001f777d58
@py import numpy as np

# ╔═╡ 0a846828-e9a7-4be5-b4ac-1001015d8cd9
# Generate six numbers equally spaced between 1 and 10 (inclusive)
np.linspace(1, 10, 6)

# ╔═╡ f05a11c6-af97-43e1-8db9-a9960d51508f
md"""
## 🔎 Mini-projects/Open-ended Exercises:

Congratulations on completing this tutorial! It is my hope that you are now prepared to start writing your own code (with lots of help from Google along the way!). Here are a few suggested mini-projects that you can try. All of these will require getting outside help from the internet, so please Google around to your heart's content (i.e. don't assume everything you need will be in this notebook).

!!! note
	 For maximum control, feel free to download this notebook and delete/add cells as you see fit!
"""

# ╔═╡ 0fd7a535-ceac-4bba-8c31-beb5834d9fb7
md"""
### #1: What is string formatting?

How is it different from using the `*` (`+` in Python) operator to combine strings? Code up a few examples:

**Bonus**: How is this related to commutivity?
"""

# ╔═╡ bd52d99f-2bd8-4b06-8095-41ea87ed9052
md"""
### #2: Plotting

Make a plot using `Makie.jl`/`Plots.jl`/`UnicodePlots.jl`/etc. in Julia, or the `matplotlib` package in Python:
"""

# ╔═╡ f59181e1-90e5-4991-a7af-73c739f9b203
md"""
### #3: Learn to read a `.fits` file

Read in and analyze this data format using [AstroImages.jl](https://juliaastro.org/dev/modules/AstroImages/) in Julia, or the [astropy](https://www.astropy.org/) package in Python:

!!! tip

	🔭 The ESA has a bunch of great astronomical objects that we can visualize on their website [here](https://esahubble.org/projects/fits_liberator/datasets_archives/).
"""

# ╔═╡ ad5bbc50-fe0d-4b9c-8d82-dbef9befdfaa
md"""
### #4: What are dictionaries (Python's name for hash tables)? 

How do they work?
"""

# ╔═╡ 0b12696c-aab0-4234-b02a-da77e16b20af
md"""
### #5: What are lists?

How do they work?
"""

# ╔═╡ 8031d533-dbd8-41bf-a03f-24a30da07d16
md"""
### #6: What's wrong with the following code?

It's not working the way the examples say it should. Please fix it! :) Fun fact: this is an example of a "recursive" function, meaning that it calls itself! 

!!! note
	Search for "Fibonacci numbers" if you are not familar with them.
"""

# ╔═╡ 6d2d036e-8eae-498d-bf73-b54216b79083
"""
	get_ith_fibonacci_number(i)

Returns the "ith" [Fibonacci number](https://en.wikipedia.org/wiki/Fibonacci_number)

# Examples
```julia-repl
julia> get_ith_fibonacci_number(0)
0
julia> get_ith_fibonacci_number(1)
1
julia> get_ith_fibonacci_number(2)
1
julia> get_ith_fibonacci_number(8)
21
```
"""
function get_ith_fibonacci_number(i)
	if i == 0
    	return 0
	elseif i == 1
    	return 0
	else
    	return get_ith_fibonacci_number(i-1) + get_ith_fibonacci_number(i-1)
	end
end

# ╔═╡ d92b9b3f-1108-4a4f-a0ea-8364d9564cab
md"""
!!! note
	This docstring should show up in the "Live docs" tab now!
"""

# ╔═╡ 95c97cd7-b355-489f-9670-8ecf6eb604e6
md"""
!!!  tip "Python 🐍"
	```python
	def get_ith_fibonacci_number(i):
	  \"""
	  This is a function that returns the "ith" Fibonnacci number.
	
	  Examples:
	    get_ith_fibonacci_number(0) -> 0
	    get_ith_fibonacci_number(1) -> 1
	    get_ith_fibonacci_number(2) -> 1
	    get_ith_fibonacci_number(8) -> 21
	
	  Args:
	    i (int) the index of the number you want
	
	  Returns:
	    float: the ith Fibonnacci number
	  \"""
	
	  if i == 0:
	      return 0
	
	  elif i == 1:
	      return 0
	
	  else:
	      return get_ith_fibonacci_number(i-1) + get_ith_fibonacci_number(i-1)
	```
"""

# ╔═╡ 96bc35c5-9b3f-4d24-8529-29d0922e208c
# You can use this line to run the code. Feel free to change the input
# as you test!
get_ith_fibonacci_number(8)

# ╔═╡ 3c6a773b-f3ad-42ec-bf81-808298b9199f
md"""
## Notebook setup 🔧

Misc. configs and helper functions here. Note that cell order does not matter.
"""

# ╔═╡ 5cde3b1e-4ec3-449b-a791-f9c975e30e36
TableOfContents()

# ╔═╡ fdf5ba27-46c7-4d6b-a523-bdb96719aa9f
msg(x; title="Details") = details(title, x);

# ╔═╡ 5834c659-011d-4a06-a72e-7d8f44a5e680
details("Using this notebook", md"""
Some parts of this [Pluto notebook](https://plutojl.org/) are partially interactive online, but for full interactive control, it is recommended to download and run this notebook locally. For instructions on how to do this, click the `Edit or run this notebook` button in the top right corner of the page, or [click on this direct link](https://computationalthinking.mit.edu/Fall23/installation/) which includes a video and written instructions for getting started with Julia and Pluto 🌱.

!!! note "First time running"
	**Note**: This notebook will download all of the analysis packages and data needed for us, so the first time it runs may take a little while (~ a few minutes depending on your internet connection and platform). Clicking on the `Status` tab in the bottom right will bring up a progress window that we can use to monitor this process, and it also includes an option at the bottom marked `Notify when done` that can be selected to give us a notification pop-up in our browser when everything is finished.

This is a fully hackable notebook, so exploring the [source code](https://github.com/icweaver/UCAN/blob/main/EBs/EB_lab.jl) and making your own modifications is encouraged! Unlike Jupyter notebooks, Pluto notebook are just plain Julia files. Any changes you make in the notebook are automatically saved to the source file.

!!! note "Advanced: bring your own editor"
	This works in the opposite direction too; any changes you make to the source file, say in your favorite editor, will automatically be reflected in the notebook in your browser! To enable this feature, just add this keyword to the function that was used to start Pluto:

	```julia-repl
	julia> using Pluto
	
	julia> Pluto.run(auto_reload_from_file=true)
	
	# This will be on by default in an upcoming release =]
	```

The location of the file for this notebook is displayed in the bar at the very top of this page, and can also be modified there if you want to change where this notebook lives.

Periodically throughout the notebook we will include collapsible sections like the one below to provide additional information about items outside the scope of this lab that may be of interest (e.g., plotting, working with javascript, creating widgets).

$(msg(msg_adding_colors))

In the local version of this notebook, an "eye" icon will appear at the top left of each cell on hover to reveal the underlying code behind it and a `Live Docs` button will also be available in the bottom right of the page to pull up documentation for any function that is currently selected. In both local and online versions of this notebook, user defined functions and variables are also underlined, and (ctrl) clicking on them will jump to where they are defined.
""")

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Colors = "5ae59095-9a9b-59fe-a467-6f913c188581"
CommonMark = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
CondaPkg = "992eb4ea-22a4-4c89-a5bb-47a3300528ab"
ImageCore = "a09fc81d-aa75-5fe9-8630-4744c3626534"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
PythonCall = "6099a3de-0909-46bc-b1f4-468b9a2dfc0d"

[compat]
Colors = "~0.12.11"
CommonMark = "~0.8.12"
CondaPkg = "~0.2.22"
ImageCore = "~0.10.2"
PlutoUI = "~0.7.59"
PythonCall = "~0.9.20"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.10.3"
manifest_format = "2.0"
project_hash = "d1a72a23fa33331ae64ee44fa94f30a366291be0"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "6e1d2a35f2f90a4bc7c2ed98079b2ba09c35b83a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.3.2"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "b10d0b65641d57b8b4d5e234446582de5047050d"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.5"

[[deps.ColorVectorSpace]]
deps = ["ColorTypes", "FixedPointNumbers", "LinearAlgebra", "Requires", "Statistics", "TensorCore"]
git-tree-sha1 = "a1f44953f2382ebb937d60dafbe2deea4bd23249"
uuid = "c3611d14-8923-5661-9e6a-0046d554d3a4"
version = "0.10.0"

    [deps.ColorVectorSpace.extensions]
    SpecialFunctionsExt = "SpecialFunctions"

    [deps.ColorVectorSpace.weakdeps]
    SpecialFunctions = "276daf66-3868-5448-9aa4-cd146d93841b"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "362a287c3aa50601b0bc359053d5c2468f0e7ce0"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.11"

[[deps.CommonMark]]
deps = ["Crayons", "JSON", "PrecompileTools", "URIs"]
git-tree-sha1 = "532c4185d3c9037c0237546d817858b23cf9e071"
uuid = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
version = "0.8.12"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[deps.CondaPkg]]
deps = ["JSON3", "Markdown", "MicroMamba", "Pidfile", "Pkg", "Preferences", "TOML"]
git-tree-sha1 = "e81c4263c7ef4eca4d645ef612814d72e9255b41"
uuid = "992eb4ea-22a4-4c89-a5bb-47a3300528ab"
version = "0.2.22"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.DataAPI]]
git-tree-sha1 = "abe83f3a2f1b857aac70ef8b269080af17764bbe"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.16.0"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "05882d6995ae5c12bb5f36dd2ed3f61c98cbb172"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.5"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "179267cfa5e712760cd43dcae385d7ea90cc25a4"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.5"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "8b72179abc660bfab5e28472e019392b97d0985c"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.4"

[[deps.ImageCore]]
deps = ["ColorVectorSpace", "Colors", "FixedPointNumbers", "MappedArrays", "MosaicViews", "OffsetArrays", "PaddedViews", "PrecompileTools", "Reexport"]
git-tree-sha1 = "b2a7eaa169c13f5bcae8131a83bc30eff8f71be0"
uuid = "a09fc81d-aa75-5fe9-8630-4744c3626534"
version = "0.10.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JLLWrappers]]
deps = ["Artifacts", "Preferences"]
git-tree-sha1 = "7e5d6779a1e09a36db2a7b6cff50942a0a7d0fca"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.5.0"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.JSON3]]
deps = ["Dates", "Mmap", "Parsers", "PrecompileTools", "StructTypes", "UUIDs"]
git-tree-sha1 = "eb3edce0ed4fa32f75a0a11217433c31d56bd48b"
uuid = "0f8b85d8-7281-11e9-16c2-39a750bddbf1"
version = "1.14.0"

    [deps.JSON3.extensions]
    JSON3ArrowExt = ["ArrowTypes"]

    [deps.JSON3.weakdeps]
    ArrowTypes = "31f734f8-188a-4ce0-8406-c8a06bd891cd"

[[deps.LazyArtifacts]]
deps = ["Artifacts", "Pkg"]
uuid = "4af54fe1-eca0-43a8-85a7-787d91b784e3"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.4.0+0"

[[deps.LibGit2]]
deps = ["Base64", "LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibGit2_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll"]
uuid = "e37daf67-58a4-590a-8e99-b0245dd2ffc5"
version = "1.6.4+0"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.0+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "2fa9ee3e63fd3a4f7a9a4f4744a52f4856de82df"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.13"

[[deps.MappedArrays]]
git-tree-sha1 = "2dab0221fe2b0f2cb6754eaa743cc266339f527e"
uuid = "dbb5928d-eab1-5f90-85c2-b9b0edb7c900"
version = "0.4.2"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.2+1"

[[deps.MicroMamba]]
deps = ["Pkg", "Scratch", "micromamba_jll"]
git-tree-sha1 = "011cab361eae7bcd7d278f0a7a00ff9c69000c51"
uuid = "0b3b1443-0f03-428d-bdfb-f27f9c1191ea"
version = "0.1.14"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MosaicViews]]
deps = ["MappedArrays", "OffsetArrays", "PaddedViews", "StackViews"]
git-tree-sha1 = "7b86a5d4d70a9f5cdf2dacb3cbe6d251d1a61dbe"
uuid = "e94cdb99-869f-56ef-bcf0-1ae2bcbe0389"
version = "0.3.4"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2023.1.10"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OffsetArrays]]
git-tree-sha1 = "e64b4f5ea6b7389f6f046d13d4896a8f9c1ba71e"
uuid = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
version = "1.14.0"

    [deps.OffsetArrays.extensions]
    OffsetArraysAdaptExt = "Adapt"

    [deps.OffsetArrays.weakdeps]
    Adapt = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.23+4"

[[deps.OrderedCollections]]
git-tree-sha1 = "dfdf5519f235516220579f949664f1bf44e741c5"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.6.3"

[[deps.PaddedViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "0fac6313486baae819364c52b4f483450a9d793f"
uuid = "5432bcbf-9aad-5242-b902-cca2824c8663"
version = "0.5.12"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "8489905bcdbcfac64d1daa51ca07c0d8f0283821"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.1"

[[deps.Pidfile]]
deps = ["FileWatching", "Test"]
git-tree-sha1 = "2d8aaf8ee10df53d0dfb9b8ee44ae7c04ced2b03"
uuid = "fa939f87-e72e-5be4-a000-7fc836dbe307"
version = "1.3.0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.10.0"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "ab55ee1510ad2af0ff674dbcced5e94921f867a9"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.59"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "5aa36f7049a63a1528fe8f7c3f2113413ffd4e1f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.1"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "9306f6085165d270f7e3db02af26a400d580f5c6"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.3"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.PythonCall]]
deps = ["CondaPkg", "Dates", "Libdl", "MacroTools", "Markdown", "Pkg", "REPL", "Requires", "Serialization", "Tables", "UnsafePointers"]
git-tree-sha1 = "8de9e6cbabc9bcad4f325bd9f2f1e83361e5037d"
uuid = "6099a3de-0909-46bc-b1f4-468b9a2dfc0d"
version = "0.9.20"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Scratch]]
deps = ["Dates"]
git-tree-sha1 = "3bac05bc7e74a75fd9cba4295cde4045d9fe2386"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.2.1"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
version = "1.10.0"

[[deps.StackViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "46e589465204cd0c08b4bd97385e4fa79a0c770c"
uuid = "cae243ae-269e-4f55-b966-ac2d0dc13c15"
version = "0.1.1"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.10.0"

[[deps.StructTypes]]
deps = ["Dates", "UUIDs"]
git-tree-sha1 = "ca4bccb03acf9faaf4137a9abc1881ed1841aa70"
uuid = "856f2bd8-1eba-4b0a-8007-ebc267875bd4"
version = "1.10.0"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "7.2.1+1"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "OrderedCollections", "TableTraits"]
git-tree-sha1 = "cb76cf677714c095e535e3501ac7954732aeea2d"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.11.1"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.TensorCore]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1feb45f88d133a655e001435632f019a9a1bcdb6"
uuid = "62fd8b95-f654-4bbd-a8a5-9c27f68ccd50"
version = "0.1.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "eae1bb484cd63b36999ee58be2de6c178105112f"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.8"

[[deps.URIs]]
git-tree-sha1 = "67db6cc7b3821e19ebe75791a9dd19c9b1188f2b"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.UnsafePointers]]
git-tree-sha1 = "c81331b3b2e60a982be57c046ec91f599ede674a"
uuid = "e17b2a0c-0bdf-430a-bd0c-3a23cae4ff39"
version = "1.0.0"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+1"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.8.0+1"

[[deps.micromamba_jll]]
deps = ["Artifacts", "JLLWrappers", "LazyArtifacts", "Libdl"]
git-tree-sha1 = "b4a5a3943078f9fd11ae0b5ab1bdbf7718617945"
uuid = "f8abcde7-e9b7-5caa-b8af-a437887ae8e4"
version = "1.5.8+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.52.0+1"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+2"
"""

# ╔═╡ Cell order:
# ╟─9c238f5b-3981-4aef-be52-b50e5b832b69
# ╠═242303ed-bf92-4563-a5b9-3b4d4554dfdd
# ╟─0e347ed0-b0df-4b81-9565-1410a74543f7
# ╟─5834c659-011d-4a06-a72e-7d8f44a5e680
# ╟─5cd392a4-5804-4748-9016-9b6baa73a85a
# ╟─ba40cbc9-363e-4dfe-98ac-28672e9864bf
# ╟─3b2b0c4a-83b0-41ea-9654-b6a11e22d0d2
# ╟─400ca605-6e11-492d-ad5c-ffade9cf3941
# ╠═11e3ad1e-588c-4d37-aa49-2d6d996c2900
# ╟─2e063e4b-595a-4b54-84e8-9250d9d2b521
# ╠═3378e493-067c-4387-bf02-d645317c8f56
# ╟─1a6c18a7-5863-4052-b823-ad26498dfa13
# ╠═5cb30b47-15ea-461c-b59d-900fda3651d0
# ╟─9b57c6ec-56e5-4658-b5c5-72b4cff06be1
# ╟─24712474-2d6f-4854-a335-ab0a3719b750
# ╠═8c5cf9ce-100a-4a80-aa82-91896960f480
# ╟─27bc4e6c-d34f-4fbf-bab0-38c56cf725ab
# ╠═5d765ca0-83f6-4a8d-a551-b272f13b179f
# ╟─17d49c7c-eb65-498f-891f-71fcf5e64134
# ╠═c7828d38-e50d-46d7-9d20-369ccdd4a9ee
# ╟─0617b99b-f93e-4ef5-bc42-b5b48d7bf2ce
# ╟─0b705ce9-7100-40cf-b12d-689c6720be80
# ╟─98944a79-cead-4110-9fb1-78600b47b2d6
# ╠═4bf8f465-7695-4366-ad89-8bbad88f7a68
# ╟─3c1f53ed-baea-4efc-8108-928ce31ae041
# ╠═f60aa8a4-6dfd-40be-bf00-e1072689db40
# ╟─58673c8e-a333-4c96-928a-5305ffdce8c7
# ╟─4397fe2c-04aa-4bec-bf4e-cbcdee0baed2
# ╟─15c35bcd-6995-4b61-84a0-a9763dd2d305
# ╠═017298fe-3a8f-415d-b712-134397c08256
# ╟─c3aeacff-cf94-4422-be59-8de51d57f373
# ╟─99738d51-2f8e-4e91-88bc-d3b8f5329dd4
# ╠═fe340371-d8e2-4b1a-8b45-d1435cc98a62
# ╟─2e646d7c-9be2-40b2-b07d-bb9214a3c8c1
# ╟─e3655b35-4bb9-42ad-a1a8-23549efd519a
# ╠═69b69d34-f4e7-4c98-875d-7d80ed487c26
# ╠═8f1cae48-bb0e-466c-94d7-b79a6e18b497
# ╠═d6d039cf-beea-49cf-83dd-96542e08ee4a
# ╠═f0dc721a-45fa-45e1-a31d-6dac6ff96d99
# ╟─bc6ec879-d744-4d04-ab47-a383b69404d1
# ╟─000cbb49-8dbf-4f3b-bca4-9825890e442a
# ╠═1cfc3faf-81ed-40a8-bb42-d6dfc9f791a1
# ╟─d3da42a6-1392-47dc-b470-be04ae82390f
# ╠═84224027-e070-4c9d-8a61-87d2f37c215e
# ╟─284b2544-9582-4adb-8bd7-186f55fce6f7
# ╟─181f6657-bea2-4907-9372-a821a79b9b6e
# ╟─ff6f9fed-0b2a-44be-abef-3e61f0764fb8
# ╠═000d55b8-ed16-4a22-aac7-f1acbb7a34da
# ╟─eb3b0a5a-aa98-4a92-b0c4-bd2ba5a82f0c
# ╟─71ac570e-8dc5-4264-8a2a-3a213f81e962
# ╠═f5dc6525-5ddc-4e48-8144-9413b2272c27
# ╟─a4097197-b224-4002-8408-4374258a4a45
# ╠═285d58f4-b42c-45fb-a741-767022f56f69
# ╟─b720baa8-143c-488f-b297-29ca987b3a51
# ╠═69ba8980-e0bd-4d6b-b881-378bebcade04
# ╟─59d0886f-b328-4081-abe0-503ac9d11266
# ╠═5ae296b7-81f2-4328-94d7-576bcfb5a8a2
# ╠═cb11a2ae-5cb6-41e6-8032-946f7526fe01
# ╟─ea2203a9-922c-4183-a78d-540ee7a87467
# ╟─91493fcc-4cb0-4532-ad57-c4e1dae4ddce
# ╟─beb7f1d0-b337-4137-a131-bd0e9c2c1200
# ╠═446a31b4-f0ad-43d7-a611-3470815b840a
# ╟─6c059624-7167-4721-b973-d3a34f035b32
# ╟─b43cde6e-dac3-4e8f-8e32-a43812ed2a5a
# ╟─bf2fbeaf-23d8-48b7-bfbc-f257d8539412
# ╠═cd8b6d99-8570-4c69-a8cc-59c9be07a3fa
# ╟─ca1a3229-5b89-4038-812f-d896f3affd0a
# ╠═5dd05f46-d7ee-4a24-84b0-8fa1e0b168cb
# ╟─ddb3498b-fd63-46d4-855f-ce13ba494811
# ╠═ff0b17c6-a91c-4640-9cdb-da69a351c9e3
# ╟─bc746e9f-02fa-42f2-8a0d-4243d3e63918
# ╠═17dee10b-24c4-44ac-b8dc-f2689d38700c
# ╟─886b45e5-6d18-49bd-9765-e4d14e4eb9d4
# ╠═7f577e74-0030-4e6d-ba1d-dc931bd2566a
# ╟─dcf61c03-7d33-413e-a994-59de55b79ca0
# ╟─453d7a14-f85d-4a9a-a2a9-ec385be3a87e
# ╟─85460bab-f096-45a5-a020-285fea1901b7
# ╟─a2685d04-459b-4919-aa70-6e350e6a0571
# ╠═6d8f33b7-dcba-42eb-8966-887a5fb3a535
# ╟─908f0673-ee21-4771-b572-58c9bc9cfea2
# ╠═bc13de91-da69-467b-ba54-d2891791e77d
# ╟─7ec3b70d-4f17-4534-bb10-98674b783239
# ╟─c61ef8ae-a8ee-48fd-bd3b-8c21912b5c2b
# ╠═7c66b494-b755-47b8-bdac-969d539a24e5
# ╟─76593ae0-a878-43e2-b207-ac77641b2045
# ╟─515ebad0-a335-4cb3-9ed8-37a2dc3c7042
# ╠═ca980f8f-10f1-45b4-ad4a-2b445059591e
# ╠═cfbd1f1e-af46-48a0-8a4b-25b7cd538a2e
# ╟─542052e5-2cf4-485a-b9fe-153a14a24cab
# ╟─13e830da-f5c0-4746-ae26-c7ed5c1647fb
# ╠═6e694ce6-a3ad-4947-869b-eba8e595ad63
# ╠═55b6933b-4a43-4cc0-82cb-f0ba0fcd848f
# ╠═3fc8a3d3-a0c8-4fff-8bac-b2001f777d58
# ╠═0a846828-e9a7-4be5-b4ac-1001015d8cd9
# ╟─f05a11c6-af97-43e1-8db9-a9960d51508f
# ╟─0fd7a535-ceac-4bba-8c31-beb5834d9fb7
# ╟─bd52d99f-2bd8-4b06-8095-41ea87ed9052
# ╟─f59181e1-90e5-4991-a7af-73c739f9b203
# ╟─ad5bbc50-fe0d-4b9c-8d82-dbef9befdfaa
# ╟─0b12696c-aab0-4234-b02a-da77e16b20af
# ╟─8031d533-dbd8-41bf-a03f-24a30da07d16
# ╠═6d2d036e-8eae-498d-bf73-b54216b79083
# ╟─d92b9b3f-1108-4a4f-a0ea-8364d9564cab
# ╟─95c97cd7-b355-489f-9670-8ecf6eb604e6
# ╠═96bc35c5-9b3f-4d24-8529-29d0922e208c
# ╟─3c6a773b-f3ad-42ec-bf81-808298b9199f
# ╠═5cde3b1e-4ec3-449b-a791-f9c975e30e36
# ╠═fdf5ba27-46c7-4d6b-a523-bdb96719aa9f
# ╠═3535775c-2d63-4c92-8c22-8f47b9e2b294
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
