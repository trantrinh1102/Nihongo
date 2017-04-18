class Admin::VocabulariesController < Admin::AdminController
  before_action :load_vocabulary, only: [:edit, :update, :destroy]

  def index
    @vocabularies = params[:lesson_id].present? ? Vocabulary.by_lesson(params[:lesson_id]) : Vocabulary.all
    respond_to do |format|
      format.html
      format.csv { send_data @vocabularies.to_csv }
    end
  end

  def new
    @vocabulary = Vocabulary.new
    respond_to do |format|
      format.js
    end
  end

  def create
    case
    when vocabulary_params[:file].present?
     vocabulary = Vocabulary.import_csv vocabulary_params[:lesson_id], vocabulary_params[:file]
     add_message_flash(:error, vocabulary)
    else
      @vocabulary = Vocabulary.new vocabulary_params
      if @vocabulary.save
        add_message_flash(:success, t("admin.created"))
      else
        add_message_flash(:error, t("admin.failed"))
      end
    end
    redirect_to :back
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    if @vocabulary.update_attributes vocabulary_params
      add_message_flash(:success, t("admin.updated"))
    else
      add_message_flash(:error, t("admin.failed"))
    end
    redirect_to :back
  end

  def destroy
    if @vocabulary.destroy
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
  def vocabulary_params
    params.require(:vocabulary).permit :janpanese, :vietnamese, :romaji, :audio, :image, :description, :lesson_id
  end

  def load_vocabulary
    @vocabulary = Vocabulary.find params[:id]
  end
end
