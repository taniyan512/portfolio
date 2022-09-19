class HomeController < ApplicationController
  def top
  
  end

  def profile
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(params.permit(:profile_image, :user_name, :self_introduce, :twitter_url, :youtube_url, :instagram_url, :self_introduce_movie_url))
      flash[:notice] = "Profile was successfully updated."
      redirect_to "/"
    else
      render 'profile'
    end
  end
end