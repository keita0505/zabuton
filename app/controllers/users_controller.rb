class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @themes = @user.themes.all.order('created_at DESC')
  end

  def edit
    @user = User.find(params[:id])
    render template: "devise/registrations/edit"
  end
  
  def update
    if current_user.update(user_params)
      @user = current_user
      render template: "users/show"
    else
      render template: "devise/registrations/edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :text, :email)
  end
end
