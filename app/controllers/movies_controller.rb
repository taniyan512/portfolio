class MoviesController < ApplicationController
  def new
    @user = current_user
    @movie = Movie.new
  end

  def create
    if @movie = Movie.create(movie_params)
      url = @movie.movie_url
      url = url.last(11)
      @movie.movie_url = url
      @movie.save
      redirect_to show_home_path(current_user.id)
    else
      render 'new'
    end 
  end

  def edit
    @user = current_user
    @movie = Movie.find(params[:id])
  end

  def update
    @movie.update(movie_params)
    url = @movie.movie_url.last(11)
    @movie.movie_url = url
    if @movie.save
      redirect_to show_home_path(current_user)
    else
      render 'edit'      
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to show_home_path(current_user.id)
  end

  private
    def movie_params
      params.require(:movie).permit(:movie_url, :user_id)
    end
end
