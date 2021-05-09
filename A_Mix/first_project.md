Mix is a tool used for creating full fledged elixir applications.

The application we are going to build acts as a distributed key-value store. At the end we are going to build a client that can talk to all the nodes and send commands like CREATE, PUT, GET


for this we are going to use
- OTP - Open Telecom Platform which is a set of tools on erlang.
- Mix - Mix is a build tool that has tasks for creating managing and testing applications.
- ExUnit - a test unit based framework that ships with Elixir

I have the repository where I created the app at https://github.com/cosmoglint/mix_hex
The original source code by Jose valim is at https://github.com/josevalim/kv_umbrella








## Heading
Creating a new project is done by using the `mix new` command

we will use

`mix new keyproject --module KeyProject` here the KeyProject is our project name and --module lets us specify the main module name of the project


you can run `mix help` for mix related commands



This creates some files that help us compile and run the project. The mix.exs file provides three functions

- project function returns the project configuration details ( name and other stuff. we can configure them )
- application function is used to generate the application file which we will run for the project.
- the deps function which tracks the dependencies for the file.



`mix compile` compiles the project and outputs a myproject.app file in the _build folder with the specifications defined in mix.exs
`iex -S mix` starts a new iex terminal session. you can also use the `iex>recompile()` function within iex to recompile the project if there are changes. it return :ok if changes were successfuly compiled of :noop if there are no changes.


Now mix also created a tests folder with two files. the my_project_test.exs file acs as the test file for the my_project.exs file.
the other file test_helper.exs file is the file that mix uses every time `mix test` is used
