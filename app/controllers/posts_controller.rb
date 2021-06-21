class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :owned_post, only: [:edit, :update, :destroy]

  def index
    #sets pagination as the default setting
    # @posts = Post.all.order('created_at DESC')
    # @posts = Post.all.sort_by { |obj| obj.updated_at }
    @pagy, @posts = pagy(Post.all.order('created_at DESC'), items: 5)

    respond_to do |format|
      format.html
      format.json {
        render json: { entries: render_to_string(partial: "shared/post", formats: [:html]), pagination: view_context.pagy_nav(@pagy) }
      }
    end
  end

  def new
    # @post = Post.new
    
    @post = current_user.posts.build
  end

  def create 
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else 
      flash[:alert] = "Your post couldn't be created! Please try again."
      render :new
    end
  end 

  def show
  end

  def edit
  end
  
  def update
    if @post.update(post_params)
      flash[:success] = "Your post has been updated!"
      redirect_to (post_path(@post))
    else
      flash.now[:alert] = "Update failed! Please try again."
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    flash[:success] = "Your post has been deleted!"
    redirect_to posts_path
  end


  def search
    @query = params[:query]
    results = User.where("lower(user_name) LIKE ?", "%#{@query.downcase}%")
    render json: { results: render_to_string('posts/_search_results', layout: false, locals: { results: results }) }
  end
  
  private 
  
  def post_params
    params.require(:post).permit(:image, :caption)
  end 


  
  def set_post 
    @post = Post.find(params[:id])
  end
  
  def owned_post 
    unless current_user.id == @post.user.id
      flash[:alert] = "you do not own this post"
        redirect_to root_path
      end
    end
end
