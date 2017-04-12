class Admin::GrammarsController < Admin::AdminController
  before_action :load_lessons, only: [:new, :edit]
  before_action :load_grammar, only: [:show, :edit, :update, :destroy]

  def index
    @grammars = Grammar.all
  end

  def new
    @grammar = Grammar.new
  end

  def show
  end

  def create
    @grammar = Grammar.new grammar_params
    if @grammar.save
      add_message_flash(:success, t("admin.created"))
    else
      add_message_flash(:error, t("admin.failed"))
    end
    redirect_to admin_grammars_path
  end

  def update
    if @grammar.update_attributes grammar_params
      add_message_flash(:success, t("admin.updated"))
    else
      add_message_flash(:error, t("admin.failed"))
    end
    redirect_to admin_grammars_path
  end

  def destroy
    if @grammar.destroy
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
  def grammar_params
    params.require(:grammar).permit :title, :lesson_id, :content
  end

  def load_grammar
    @grammar = Grammar.find params[:id]
  end

  def load_lessons
    @lessons = Lesson.all
  end
end
