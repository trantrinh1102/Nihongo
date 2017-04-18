class Admin::KanjisController < Admin::AdminController
  before_action :load_kanji, only: [:edit, :update, :destroy]

  def index
    @kanjis = params[:lesson_id].present? ? Kanji.by_lesson(params[:lesson_id]) : Kanji.all
    respond_to do |format|
      format.html
      format.csv { send_data @kanjis.to_csv }
    end
  end

  def new
    @kanji = Kanji.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @kanji = Kanji.new kanji_params
    case
    when kanji_params[:file].present?
     kanji = Kanji.import_csv kanji_params[:lesson_id], kanji_params[:file]
     add_message_flash(:error, kanji)
    else
      if @kanji.save
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
    if @kanji.update_attributes kanji_params
      add_message_flash(:success, t("admin.updated"))
    else
      add_message_flash(:error, t("admin.failed"))
    end
    redirect_to admin_kanjis_path
  end

  def destroy
    if @kanji.destroy
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
  def kanji_params
    params.require(:kanji).permit :character, :vietnamese, :onyomi, :kunyomi, :example, :file, :lesson_id
  end

  def load_kanji
    @kanji = Kanji.find params[:id]
  end

end
