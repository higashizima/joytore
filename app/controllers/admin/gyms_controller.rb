class Admin::GymsController < ApplicationController

  def new
    @gym = Gym.new
  end

  def index
    @gyms = Gym.all
  end

  def create
    @gym = Gym.new(gym_params)
    if @gym.save
      redirect_to admin_gyms_path
    else
       render :new
    end
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  def update
    @gym = Gym.find(params[:id])
    if @gym.update(gym_params)
      redirect_to admin_gyms_path
    else
      render :edit
    end
  end

  def destroy
    @gym = Gym.find(params[:id])
    @gym.destroy
    redirect_to admin_gyms_path
  end

  private

  def gym_params
    params.require(:gym).permit(:gym_name, :postcode, :address, :fee, :is_open)
  end

end
