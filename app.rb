
require('sinatra')
require('sinatra/reloader')
require('pry')
require("pg")

DB = PG.connect({:dbname => "message_board"})
categories = ["funny", "not_funny", "movies", "music", "general"]


get ('/')do
  erb :default
end

post ('/add_message')do
  DB.exec("INSERT INTO messages VALUES ('#{params[:user_name]}', '#{params[:content]}', '#{Time.new.to_s}');")
  redirect to ('/')
end


get ('/:board_name') do
  if categories.include?(params[:board_name]) == false
    redirect to ('/whoops')
  end
  @posts = DB.exec("SELECT * FROM #{params[:board_name]}")
  @board_name = params[:board_name]
  erb :board
end


post ('/:board_name/post_message')do
  DB.exec("INSERT INTO #{params[:board_name]} VALUES ('#{params[:user_name]}', '#{params[:content]}', '#{Time.new.to_s}');")
  redirect to ("#{params[:board_name]}")
end

get('/whoops')do
  "Whoops!!!"
end
