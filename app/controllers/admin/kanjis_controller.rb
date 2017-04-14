class Admin::KanjisController < Admin::AdminController

  def index
    @kanjis = Kanji.all
    binding.pry
    respond_to do |format|
      format.html
      format.csv { send_data @kanjis.to_csv }
    end
  end

  def show

  end

  def new
    @kanji = Kanji.new
  end

  def create

  end

  private
  def kanji_params
    params.require(:kanji).permit :character, :vietnamese, :romaji, :example, :hira_kata
  end

end
