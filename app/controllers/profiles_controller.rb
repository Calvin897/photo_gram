class ProfilesController < ApplicationController
  before_action :set_user
  before_action :owned_profile, only: [:edit, :update]

  def show
    @posts = User.find_by(user_name: params[:user_name]).posts.order('created_at DESC')
  end

  def edit 
  end

  def update
    if @user.update(profile_params)
      flash[:success] = 'Your profile has been updated.'
      redirect_to profile_path(@user.user_name)
    else
      @user.errors.full_messages
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  # def follow_count
  #   the_user_id = params[:guy_to_follow_param]
  #   user_that_gets_followed = User.find user.user_id
  #   user_that_gets_followed.follower_relationships.create(follower_id: current_user.id)
  #   user_that_gets_followed_followers_count = user_that_gets_followed.followers.count
  #   render json: {user_that_gets_followed_followers_count_gleeeeen: user_that_gets_followed_followers_count}
  # end

  private

  def profile_params
    params.require(:user).permit(:avatar, :bio)
  end
  
  def set_user 
    @user = User.find_by(user_name: params[:user_name])
  end

  def owned_profile 
    unless current_user == @user
      flash[:alert] = "this profile does not belong to you"
        redirect_to root_path
      end
    end


end
