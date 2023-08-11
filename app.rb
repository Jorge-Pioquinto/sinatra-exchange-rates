require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/USD") do
  erb(:convert_usd)
end 
