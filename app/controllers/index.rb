get '/' do
  erb :index
end

get '/post/:post_id' do
  @post = Post.find(params[:post_id])
  erb :comments
end

get '/login' do
  erb :login
end

get '/user/:user_id' do
  @user = User.find(params[:user_id])
  erb :user
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/comments/:user_id' do
  @user = User.find(params[:user_id])  
  erb :user_comments
end

get '/submissions/:user_id' do
  @user = User.find(params[:user_id])  
  erb :submissions
end

#####################################

post '/comment/:post_id' do
  Comment.create(text: params[:text], post_id: params[:post_id], user_id: current_user.id)
  redirect "/post/#{params[:post_id]}"
end

post '/register' do
  @user = User.new(email: params[:email])
  @user.password = params[:password]
  if @user.save
    session[:user_id] = @user.id
  end
  redirect '/'
end

post '/login' do
  @user = User.find_by_email(params[:email])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :login
  end
end

post '/submit' do
  Post.create(title: params[:title], url: params[:url], user_id: session[:user_id])
  redirect to('/')
end

