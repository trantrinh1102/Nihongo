class Admin::CategoriesController <  Admin::AdminController
  before_action :load_category, only: [:edit, :update, :destroy]
  def index
    @search_category = Category.ransack params[:q]
    @categories = @search_category.result.page(params[:page]).per(Settings.paginate.medium_page)
  end

  def new
    @category = Category.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @category = Category.new category_params
    if @category.save
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
    if @category.update_attributes category_params
      add_message_flash(:success, t("admin.updated"))
    else
      add_message_flash(:error, t("admin.failed"))
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    if @category.destroy
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
  def category_params
    params.require(:category).permit :name, :description
  end

  def load_category
    @category = Category.find_by id: params[:id]
  end
end
