class NoticesController < ApplicationController


  # def coolio_man
  #   params
  # end

  def seen
   
    current_user.notices.all.each do |notice|
      notice.read = true
    end

  end

  def link_through
    @notice = Notice.find(params[:id])
    @notice.update read: true
    redirect_to post_path @notice.post
  end

  
end
