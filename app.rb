require "sinatra"
require "sinatra/reloader"

# TODO: get "/"
get("/") do
  erb(:root)
end

get("/payment/new") do
  erb(:payment_new)
end

# get("/payment/results") do
#   @monthly_rate = (params.fetch("user_apr").to_f/100) / 12
#   @total_payments = params.fetch("user_years").to_f * 12
#   @principal_input = params.fetch("user_pv").to_f
#   if @monthly_rate == 0
#     @payment_results = @principal_input / @total_payments
#   else
#   @numerator = @monthly_rate * (1 + @monthly_rate)**@total_payments
#   @denominator = (1 + @monthly_rate) ** @total_payments - 1
#   @monthly_payment = @principal_input * (@numerator / @denominator)
#   @payment_results = @monthly_payment.to_fs(:percentage, { :precision => 4 } )
#   erb(:payment_results)
# end

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
