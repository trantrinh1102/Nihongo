class Admin::QuestionsController < ApplicationController
  before_action :load_question, only: [:update, :edit, :destroy]

  def new
    @question = Question.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @question = Question.new questions_params
    if @question.save
     add_message_flash(:success, t("admin.created"))
    else
      add_message_flash(:error, t("admin.failed"))
    end
    redirect_to :back
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    if @question.update_attributes questions_params
     add_message_flash(:success, t("admin.updated"))
    else
      add_message_flash(:error, t("admin.failed"))
    end
    redirect_to :back
  end


  private

  def questions_params
    params.require(:question).permit :test_id, :content, answers_attributes: [:id, :content, :is_correct, :_destroy]
  end

  def load_question
    @question = Question.find params[:id]
  end
end
