require "sinatra"
require "sinatra/reloader"

# TODO: get "/"
get("/") do
  erb(:root)
end

get("/payment/new") do
 erb(:payment_new)
end

get("/payment/results") do
  @apr_input = (params.fetch("user_apr").to_f / 100) / 12
  @years_input = params.fetch("user_years").to_i * 12
  @principal_input = params.fetch("user_pv").to_f

  @numerator = @apr_input * @principal_input
  @denominator = 1 - (1 + @apr_input) ** -@years_input
  @payment = @numerator / @denominator
  @monthly_payment = payment.to_fs(:percentage, { :precision => 4 } )
  erb(:payment_results)
end

get("/random/new") do
  erb(:random_new)
end

get("/random/results") do

  @minimum = params.fetch("Minimum").to_f
  @maximum = params.fetch("Maximum").to_f

  @random_number = rand(@minimum..@maximum)
  erb(:random_results)
end

get("/square_root/new") do
  erb(:square_root_new)
end

get("/square_root/results") do
  @input = params.fetch("input_number").to_f

  @square_root = Math.sqrt(@input)
  erb(:square_root_results)
end

get("/square/new") do
  erb(:square_new)
end

get ("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_square = @the_num ** 2
  erb(:square_results)
end
