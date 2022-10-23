class HomeController < ApplicationController
  def top
    @q = User.ransack(params[:q])
    @services = Service.all
  end

  def profile
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(params.permit(:profile_image, :user_name, :self_introduce, :twitter_url, :youtube_url, :instagram_url))
      flash[:notice] = "Profile was successfully updated."
      redirect_to "/"
    else
      render 'profile', status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    @user_movies = @user.movies
    @services = @user.services
  end

  def search
    @q = User.ransack(params[:q])
    @results = @q.result
  end
end
