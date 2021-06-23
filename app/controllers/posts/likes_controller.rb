class Posts::LikesController < ApplicationController
    before_action :set_post
    
  
    

   def create
     @like = @post.likes.where(user_id: current_user.id).first_or_create
     
     if @like.save
      create_notice

     respond_to do |format|
      format.html { redirect_to @post }
      format.js 
    end
  end
end

 def destroy
   @like = @post.likes.where(user_id: current_user.id).destroy_all

   
    respond_to do |format|
        format.html { redirect_to @post }
        format.js 
      end
    end
  

  private
      
  def create_notice
    @notice = Notice.create(user_id: @post.user.id, notified_by: current_user.id, post_id: @post.id, identifier: @post.id, notice_type: 'like')
  end

    def set_post
      @post = Post.find(params[:post_id])
    end
end