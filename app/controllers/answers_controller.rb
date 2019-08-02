class AnswersController < ApplicationController
  before_action :set_theme
  def index
    @answer = Answer.new
    @answers = @theme.answers.includes(:user)
  end
  def create
    @answer = @theme.answers.new(answer_params)
    if @answer.save
      redirect_to theme_answers_path(@theme)
    else
      @answers = @theme.answers.includes(:user)
    end
  end
  private
  def answer_params
    params.require(:answer).permit(:text).merge(user_id: current_user.id)
  end
  def set_theme
    @theme = Theme.find(params[:theme_id])
  end
end
