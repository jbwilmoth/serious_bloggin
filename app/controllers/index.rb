get '/' do
  @posts = Post.all
  erb :index
end

get '/new_post' do
  erb :new_post
end

post '/' do
  @title = params[:title]
  @content = params[:content]
  @tag = params[:tag]
  @new_post = Post.create(title: @title, content: @content)
  @new_tag = @new_post.tags.create(tag_name: @tag)
  redirect to('/')
end

get '/delete_post/:id' do
  @id = params[:id]
  @post = Post.find_by_id(@id)
  @post.destroy
end

get '/edit_post/:id' do
  @id = params[:id]
  @post = Post.find_by_id(@id)
  erb :edit, :layout => false
end

post '/save_post' do
  @title = params[:title]
  @content = params[:content]
  @id = params[:id]
  @updated_post = Post.find_by_id(@id)
  @updated_post.update_attributes(title: @title, content: @content)
  return "Post Saved!"
end
