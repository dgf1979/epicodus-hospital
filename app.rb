require('sinatra')
require('sinatra/reloader')
require('./lib/doctor')
require('./lib/patient')
also_reload('lib/**/*.rb')
require("pg")

get('/') do
  erb(:index)
end
