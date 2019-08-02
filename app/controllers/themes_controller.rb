class ThemesController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @themes = Theme.all.order('created_at DESC')
  end

  def show
  end

  def create
    @theme=Theme.new(theme_params)
    if @theme.save
      @themes = Theme.all.order('created_at DESC')
      redirect_to themes_path(@themes), notice: 'メッセージが送信されました'
    else
      @themes = Theme.all.order('created_at DESC')
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def theme_params
    params.require(:theme).permit(:text,:image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
end
