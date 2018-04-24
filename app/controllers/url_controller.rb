class UrlController < ApplicationController
  def index; end

  def show
    @url = Url.find_by url_id: params[:url_id]

    unless @url
      flash[:danger] = t 'error.short_link_not_found'
      render 'landings/index'
    end
  end

  def redirect_user
    @url = Url.find_by url_id: params[:url_id]

    if @url
      @url.update click: @url.click + 1
      redirect_to @url.url
    else
      flash[:danger] = t 'error.short_link_not_found'
      render 'landings/index'
    end
  end

  def generate
    @url = Url.new(params.require(:url).permit(:url, :status))
    @url.url_id = generate_id

    if @url.save
      redirect_to settings_path @url.url_id
    else
      flash[:danger] = t 'error.something_went_wrong'
      render 'landings/index'
    end
  end

  private

  def generate_id
    alphabet = Array('A'..'Z') + Array('a'..'z')
    numbers = Array(0..9)
    Array.new(6) { (alphabet + numbers).sample }.join
  end
end
