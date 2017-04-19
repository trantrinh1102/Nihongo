class Admin::TestsController < Admin::AdminController
  before_action :load_lesson, only: [:new, :edit, :show]
  before_action :load_test, only: [:show, :edit, :update, :destroy]
  def new
    @test = Test.new
    respond_to do |format|
      format.js
    end
  end

  def show
    @questions = @test.questions.includes(:answers)
  end

  def index
    @search_test = params[:lesson_id].present? ? Test.by_lesson(params[:lesson_id]).order(:lesson_id).ransack(params[:q]) : Test.all.order(:lesson_id).ransack(params[:q])
    @tests = @search_test.result.page(params[:page]).per(Settings.paginate.medium_page)
  end

  def create
    @test = Test.new tests_params
    if @test.save
      add_message_flash(:success, t("admin.created"))
    else
      add_message_flash(:error, t("admin.failed"))
    end
    redirect_to admin_test_path @test
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    if @test.update_attributes tests_params
      add_message_flash(:success, t("admin.updated"))
    else
      add_message_flash(:error, t("admin.failed"))
    end
    redirect_to :back
  end

  def destroy
    if @test.destroy
      flash.now[:success] = t "admin.destroy"
    end
    respond_to do |format|
      format.json do
        render json:{
          flash: flash
        }
      end
    end

  end

  private
  def tests_params
    params.require(:test).permit :name, :description, :lesson_id
  end

  def load_lesson
    @lessons = Lesson.all
  end

  def load_test
    @test = Test.find params[:id]
  end
end
