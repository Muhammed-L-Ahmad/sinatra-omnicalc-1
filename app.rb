require "sinatra"
require "sinatra/reloader"

get("/random/new") do

  erb(:random_new)
end

get("/square/root") do
  @the_num = params.fetch("num_to_square").to_f

  @the_result = @the_num / @the_num
  erb(:square_root)
end

get("/square/new") do
  erb(:new_square_calc)
end

get '/square/results' do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2
  erb(:square_results)
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
