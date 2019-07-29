
require('sinatra')
require('sinatra/reloader')
require('pry')
require("pg")

DB = PG.connect({:dbname => "message_board"})



get ('/')do
  @posts = DB.exec("SELECT * FROM messages")
  erb :default
end

post ('/add_message')do
  DB.exec("INSERT INTO messages VALUES ('#{params[:user_name]}', '#{params[:content]}', '#{Time.new.to_s}');")
  redirect to ('/')
end
