class MoviesController < ApplicationController
  def new
    @user = current_user
    @movie = Movie.new
  end

  def create
      @user = current_user
      @movie = Movie.create(movie_params)
      url = @movie.movie_url
      url = url.last(11)
      @movie.movie_url = url
    if  @movie.save
      redirect_to show_home_path(current_user.id)
      flash[:notice] = "動画を添付しました。"
    else
      render 'new', status: :unprocessable_entity
    end 
  end

  def edit
    @user = current_user
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @user = current_user
    if @movie.update(movie_params)
      url = @movie.movie_url.last(11)
      @movie.movie_url = url
      @movie.save
      redirect_to show_home_path(current_user)
      flash[:notice] = "動画を編集しました。"
    else
      render 'edit', status: :unprocessable_entity      
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to show_home_path(current_user.id)
    flash[:notice] = "動画を削除しました。"
  end

  private
    def movie_params
      params.require(:movie).permit(:movie_url, :user_id)
    end
end
