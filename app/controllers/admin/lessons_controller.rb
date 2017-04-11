class Admin::LessonsController <  Admin::AdminController
  before_action :load_lesson, only: [:edit, :update, :destroy]
  before_action :load_categories, only: [:new, :edit]

  def index
    @search_lesson = Lesson.all.order(:category_id).ransack(params[:q])
    @lessons = @search_lesson.result.page(params[:page]).per(Settings.paginate.medium_page)
  end

  def new
    @lesson = Lesson.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @lesson = Lesson.new lesson_params
    if @lesson.save
      add_message_flash(:success, t("admin.created"))
    else
      add_message_flash(:error, t("admin.failed"))
    end
    respond_to do |format|
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    if @lesson.update_attributes lesson_params
      add_message_flash(:success, t("admin.updated"))
    else
      add_message_flash(:error, t("admin.failed"))
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    if @lesson.destroy
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
  def lesson_params
    params.require(:lesson).permit :name, :description, :category_id
  end

  def load_lesson
    @lesson = Lesson.find params[:id]
  end

  def load_categories
    @categories = Category.all
  end
end
