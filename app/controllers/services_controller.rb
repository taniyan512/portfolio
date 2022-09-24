class ServicesController < ApplicationController
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
end
