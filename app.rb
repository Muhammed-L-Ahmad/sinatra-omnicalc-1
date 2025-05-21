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
  
  # parse params
  @apr = params.fetch("user_apr").to_f
  @number_of_years = params.fetch("user_years").to_i
  @principal = params.fetch("user_pv").to_f
  
  
  # calculate results
  monthly_rate = @apr / 100 / 12
  total_payments = (@number_of_years * 12)
  if monthly_rate == 0
    @payment_results = @principal / total_payments
  end

  numerator = monthly_rate * (1 + monthly_rate)**total_payments
  denominator = (1 + monthly_rate) ** total_payments - 1
  
  @monthly_payment = @principal * (numerator / denominator)

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
