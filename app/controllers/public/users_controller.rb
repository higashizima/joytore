class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  
  def index
    
  end
  
  def show
    @user = current_user
  end
  
  def edit
    
  end
  
  
end
