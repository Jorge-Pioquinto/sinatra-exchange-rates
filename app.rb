require "sinatra"
require "sinatra/reloader"
require 'json'
require 'http'

get("/") do
  currencies_data = JSON.parse(HTTP.get('https://api.exchangerate.host/symbols'))
  @currencies = currencies_data['symbols']

  erb(:homepage)
end

get '/:from_currency' do
  @from_currency = params[:from_currency]
  currencies_data = JSON.parse(HTTP.get('https://api.exchangerate.host/symbols'))
  @currencies = currencies_data['symbols']

  erb(:convert)
end

get '/:from_currency/:to_currency' do
  @from_currency = params[:from_currency]
  @to_currency = params[:to_currency]
  conversion_data = JSON.parse(HTTP.get("https://api.exchangerate.host/convert?from=#{@from_currency}&to=#{@to_currency}"))
  @rate = conversion_data['result']

  erb(:conversion)
end
