class CommentsController < ApplicationController
    before_action :set_post

    def index
      @comments = @post.comments.order("created_at ASC")
  
      respond_to do |format|
        format.html { render layout: !request.xhr? }
      end
    end

    def create
      @comment = @post.comments.build(comment_params)
      @comment.user_id = current_user.id
      
      #allow Ajax request for comments
      if @comment.save
        create_notice
        # current_user.notices << @notice
        #  @post.user.notices << @notice     
        respond_to do |format|
          format.html { redirect_to root_path }
          format.js
        end
      else
        flash[:alert] = "Check the comment form, something went wrong."
        render root_path
      end
    end
    
    def destroy
      @comment = @post.comments.find(params[:id])
      
      if @comment.user_id == current_user.id
        @comment.delete
        respond_to do |format|
          format.html { redirect_to root_path }
          format.js
        end
      end
    end
    
    private
    
    def create_notice
      @notice = Notice.create(user_id: @post.user.id, notified_by: current_user.id, post_id: @post.id, identifier: @comment.id, notice_type: 'comment')
    end
  
    
    def comment_params
      params.require(:comment).permit(:content)
    end
    
    def set_post
      @post = Post.find(params[:post_id])
    end

end
