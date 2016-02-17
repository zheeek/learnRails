class LoginsController < ApplicationController
 
  def new
    
  end
 
  def create
    chef = Chef.find_by(email: params['email'])
    if chef && chef.authenticate(params['password'])
      session[:chef_id] = chef.id
      flash[:success] ="با موفقیت وارد شدید ."
      redirect_to root_path
    else
      flash.now['danger'] = 'ایمیل یا پسورد اشتباه است'
      render :new
    end
  end

  def destroy
    session[:chef_id] =nil
    flash['success'] = 'با موفقیت خارج شدید'
    redirect_to root_path
  end
end
