### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 3535775c-2d63-4c92-8c22-8f47b9e2b294
using PlutoUI, PyCall

# ╔═╡ 9c238f5b-3981-4aef-be52-b50e5b832b69
md"""
# Intro to Coding 🌳

$(TableOfContents())
"""

# ╔═╡ 1021e2b0-3d2e-11ec-2bec-9daa7040f116
md"""
## Coding for the First Time!

Sarah Blunt (2021)

This tutorial takes you through some foundational Python operations, from the perspective of a research astronomer. It aims to provide a bit of backround on how computers interpret code, while at the same time showing you what you need to type in order to make things work.

I absolutely encourage you to look up other intro Python tutorials on the internet (e.g. <https://www.learnpython.org/>)! There are some excellent free resources out there.

The main part of this lesson is designed to take 1 hour, and to be executed independently while an instructor walks around to answer questions and give hints.

The mini-projects at the very end are open-ended, and may take between 10 mins and a few hours each. The idea is to pick one (or a few) to work on, rather than aiming to complete all of them.

By the end of this tutorial, you will be able to:
* Use comments, variables, functions, conditionals, loops, and imports to write Python code.
* Identify objects of type str, float, int, function, and bool, and use Python's type function to check.
* Explain the three main steps a computer executes while running code, and analyze the current state of the local environment after each line is parsed.
"""

# ╔═╡ 400ca605-6e11-492d-ad5c-ffade9cf3941
md"""
## Comments

In coding/programming, comments are lines starting with one or more special characters. In Julia and Python, these are `#` for single line comments, or `\"""` wrapped around multi-line comments. The computer treats them as if they don't exist! 
"""

# ╔═╡ 11e3ad1e-588c-4d37-aa49-2d6d996c2900
# Try running this cell (by pressing `shift-enter` or selecting the play button
# below this cell); nothing will happen.

# Why do you think we have comments, if they don't cause the computer to do anything?

# ╔═╡ 6f23536e-1dea-4367-92e7-cc424f6cc2d4
md"""
Type your answer here:


"""

# ╔═╡ 8806bdae-d1dd-416d-a03d-742793e464fd
md"""
!!! note
	The cell above is a [Markdown](https://www.markdownguide.org/basic-syntax/) string. We will talk more about strings later in the notebook. After you are finished typing in your answer, you can view the resulting output by running the cell, and hide the source code by selecing the eye icon on the left.
"""

# ╔═╡ 8547a71e-0508-4deb-9ad7-425f0b2ab50f
md"""
!!! tip
	We can also create multi-line comments in Julia by wrapping them in `#=` and `=#` like an open and close parenthesis, respectively.
"""

# ╔═╡ 1a6c18a7-5863-4052-b823-ad26498dfa13
md"""
## Your First Line of Code!

What do you think will happen when you run the following line of code?
"""

# ╔═╡ 5cb30b47-15ea-461c-b59d-900fda3651d0
with_terminal() do
	println("Hello my friend!")
end

# ╔═╡ 9b57c6ec-56e5-4658-b5c5-72b4cff06be1
md"""
!!! tip "🐍"

	```Python
	print("Hello my friend!")
	```
"""

# ╔═╡ 0d4c809b-a39e-4353-9746-21ae9c78137b
md"""
!!! note
	You can ignore the `with_terminal() do` stuff; it's just to give us a fancy terminal window to see output directly in this notebook.
"""

# ╔═╡ 24712474-2d6f-4854-a335-ab0a3719b750
md"""
Try printing out your own message below:
"""

# ╔═╡ 8c5cf9ce-100a-4a80-aa82-91896960f480
with_terminal() do
## your code here: ##

	
####################
end

# ╔═╡ 96d58ab3-92a5-41e8-8bba-6f75e787558b
md"""
## Types

What's the difference between:

```julia
	println("Hello my friend!")
```

and

```
	println(Hello World!)
```

What happens when you try running it?
"""

# ╔═╡ f3fb2c66-9df2-4df4-8368-dcab98b470ad
println(Hello World!)

# ╔═╡ 99738d51-2f8e-4e91-88bc-d3b8f5329dd4
md"""
We've encountered our first error! These can be frustrating when you are starting out, but they are eventually very helpful. They tell you that A) something is wrong with your code, and B) give you clues as to where and why something went wrong.

The reason we encountered this error is because the `print` function only operates on certain **types**.

Here are a few examples of some important types:


```Julia
"hello" # type "String"
13      # type "Int64" (short for "Integer")
13.4    # type "Float64"
```

!!! tip "🐍"
	```Python
	"hello" # type "str" (short for "string")
	13      # type "int" (short for "integer")
	13.4    # type "float"
	```

You can use the `typeof` function to figure out the types of each of these:
"""

# ╔═╡ fe340371-d8e2-4b1a-8b45-d1435cc98a62
with_terminal() do
	println(typeof("hello"))
	println(typeof(13))
	println(typeof(13.4))
end

# ╔═╡ 2e646d7c-9be2-40b2-b07d-bb9214a3c8c1
md"""
!!! tip "🐍"
	```Python
	print(type("hello"))
	print(type(13))
	print(type(13.4))
	```
"""

# ╔═╡ e3655b35-4bb9-42ad-a1a8-23549efd519a
md"""
What would you guess are the types of the following? Use the `typeof` function to check!

```Julia
"hi there!" # 1
13.         # 2
13 + 14     # 3
```
"""

# ╔═╡ 69b69d34-f4e7-4c98-875d-7d80ed487c26
# Your answer here

# ╔═╡ e9a938bf-ba07-4181-b347-66fd5eab280e
md"""
!!! hint "Answer"
	String, Float64, Int64
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
PyCall = "438e738f-606a-5dbb-bf0a-cddfbfd45ab0"

[compat]
PlutoUI = "~0.7.18"
PyCall = "~1.92.5"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "0ec322186e078db08ea3e7da5b8b2885c099b393"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.0"

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Conda]]
deps = ["JSON", "VersionParsing"]
git-tree-sha1 = "299304989a5e6473d985212c28928899c74e9421"
uuid = "8f4d0f93-b110-5947-807f-2305c1781a2d"
version = "1.5.2"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[HypertextLiteral]]
git-tree-sha1 = "5efcf53d798efede8fee5b2c8b09284be359bf24"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.2"

[[IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[LinearAlgebra]]
deps = ["Libdl"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "3d3e902b31198a27340d0bf00d6ac452866021cf"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.9"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "ae4bbcadb2906ccc085cf52ac286dc1377dceccc"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.1.2"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "57312c7ecad39566319ccf5aa717a20788eb8c1f"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.18"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[PyCall]]
deps = ["Conda", "Dates", "Libdl", "LinearAlgebra", "MacroTools", "Serialization", "VersionParsing"]
git-tree-sha1 = "4ba3651d33ef76e24fef6a598b63ffd1c5e1cd17"
uuid = "438e738f-606a-5dbb-bf0a-cddfbfd45ab0"
version = "1.92.5"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[VersionParsing]]
git-tree-sha1 = "e575cf85535c7c3292b4d89d89cc29e8c3098e47"
uuid = "81def892-9a0e-5fdd-b105-ffc91e053289"
version = "1.2.1"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╠═3535775c-2d63-4c92-8c22-8f47b9e2b294
# ╟─9c238f5b-3981-4aef-be52-b50e5b832b69
# ╟─1021e2b0-3d2e-11ec-2bec-9daa7040f116
# ╟─400ca605-6e11-492d-ad5c-ffade9cf3941
# ╠═11e3ad1e-588c-4d37-aa49-2d6d996c2900
# ╠═6f23536e-1dea-4367-92e7-cc424f6cc2d4
# ╟─8806bdae-d1dd-416d-a03d-742793e464fd
# ╟─8547a71e-0508-4deb-9ad7-425f0b2ab50f
# ╟─1a6c18a7-5863-4052-b823-ad26498dfa13
# ╠═5cb30b47-15ea-461c-b59d-900fda3651d0
# ╟─9b57c6ec-56e5-4658-b5c5-72b4cff06be1
# ╠═0d4c809b-a39e-4353-9746-21ae9c78137b
# ╟─24712474-2d6f-4854-a335-ab0a3719b750
# ╠═8c5cf9ce-100a-4a80-aa82-91896960f480
# ╟─96d58ab3-92a5-41e8-8bba-6f75e787558b
# ╠═f3fb2c66-9df2-4df4-8368-dcab98b470ad
# ╟─99738d51-2f8e-4e91-88bc-d3b8f5329dd4
# ╠═fe340371-d8e2-4b1a-8b45-d1435cc98a62
# ╟─2e646d7c-9be2-40b2-b07d-bb9214a3c8c1
# ╟─e3655b35-4bb9-42ad-a1a8-23549efd519a
# ╠═69b69d34-f4e7-4c98-875d-7d80ed487c26
# ╟─e9a938bf-ba07-4181-b347-66fd5eab280e
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
