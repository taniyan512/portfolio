class ServicesController < ApplicationController
  before_action :ensure_user, only: [:edit, :update, :destroy]

  def index
    @services = Service.all
  end
  
  def new
  end

  def create
    @service = Service.new(params.permit(:lesson_time, :lesson_price, :lesson_detail))
    @service.user_id = current_user.id
    if @service.save
      flash[:notice] = "サービスの作成に成功しました。"
      redirect_to "/"
    else
      render 'new'
    end 
  end

  def show 
    @service = Service.find(params[:id])
  end

  def edit
  end

  def update
    if @service.update(params.require(:service).permit(:lesson_time, :lesson_price, :lesson_detail))
      redirect_to services_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def ensure_user
    @services = current_user.services
    @service = @services.find_by(id: params[:id])
    redirect_to new_service_path unless @service
  end
end
