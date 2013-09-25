get '/' do
  erb :index
end

get '/post/:post_id'
  @post_id = params[:post_id]
  erb :comments
end
