class ServicesController < ApplicationController
  before_action :ensure_user, only: [:edit, :update, :destroy]

  def index
    @services = Service.all
  end
  
  def new
    @service = Service.new
  end

  def create
    @service = Service.new(params.permit(:lesson_time, :lesson_price, :lesson_detail))
    @service.user_id = current_user.id
    if @service.save
      redirect_to "/"
      flash[:notice] = "サービスを作成しました。"
    else
      render 'new', status: :unprocessable_entity
    end 
  end

  def show 
    @service = Service.find(params[:id])
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    if @service.update(params.require(:service).permit(:lesson_time, :lesson_price, :lesson_detail))
      redirect_to show_home_path(current_user.id)
      flash[:notice] = "サービスを編集しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @service.destroy
    
    respond_to do |format|
      format.html { redirect_to show_home_path(current_user.id), notice: "サービスを削除しました。", status: :see_other }
      format.json { head :no_content }
    end
  end

  def apply
    
  end

  private
  def ensure_user
    @services = current_user.services
    @service = @services.find_by(id: params[:id])
    redirect_to new_service_path unless @service
  end
end
