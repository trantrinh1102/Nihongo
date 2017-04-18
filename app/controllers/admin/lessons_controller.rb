class Admin::LessonsController <  Admin::AdminController
  before_action :load_lesson, only: [:edit, :update, :destroy, :show]
  before_action :load_categories, only: [:new, :edit]

  def index
    @search_lesson = Lesson.all.order(:category_id).ransack(params[:q])
    @lessons = @search_lesson.result.page(params[:page]).per(Settings.paginate.medium_page)
  end

  def new
    @lesson = Lesson.new
    @lesson.kanjis.build
    respond_to do |format|
      format.js
    end
  end

  def create
    @lesson = Lesson.new lesson_params
    if @lesson.save
      Kanji.import_csv @lesson.id, lesson_params[:file_kanji] if lesson_params[:file_kanji].present?
      Vocabulary.import_csv @lesson.id, lesson_params[:file_voca] if lesson_params[:file_voca].present?

      add_message_flash(:success, t("admin.created"))
    else
      add_message_flash(:error, t("admin.failed"))
    end
    redirect_to admin_lessons_path
  end

  def edit
  end

  def update
    if @lesson.update_attributes lesson_params
      add_message_flash(:success, t("admin.updated"))
    else
      add_message_flash(:error, t("admin.failed"))
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
    params.require(:lesson).permit :name, :description, :category_id, :file_kanji, :file_voca,
      kanjis_attributes: [:id, :character, :vietnamese, :onyomi, :kunyomi, :example, :_destroy],
      vocabularies_attributes: [:id, :japanese, :vietnamese, :romaji, :audio, :image, :description, :_destroy]
  end

  def load_lesson
    @lesson = Lesson.find params[:id]
  end

  def load_categories
    @categories = Category.all
  end
end
