class Api::V1::PostsController < ApplicationController

  def index
    if params[:user_id]
      user = User.find_by(id: params[:user_id])

      if user
        posts = Post.all
        render json: posts
      else
        render json: { message: 'Invalid user ID' }, status: :unprocessable_entity
      end
    else
      render json: { message: 'You must be a registered user' }, status: :unauthorized
    end
  end


  def create
    user = User.find_by(id: params[:user_id])

    if user
      post = user.posts.build(post_params)

      if post.save
        render json: post, status: :created
      else
        render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { message: 'Invalid user ID' }, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
