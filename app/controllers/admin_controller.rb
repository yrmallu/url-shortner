class AdminController < ApplicationController
  before_action :authorize

  # Get all URL from database
  def index
    @url = Url.all
  end

  # Delete query from database with :delete method
  def destroy
    url = Url.find(params[:id])

    # If it is successful return a success message with flash
    # If not return error message. Sysadmin should check error.
    # TODO: Write I18n for 19 and 22.
    if url.destroy
      flash[:success] = t 'dashboard.successfully_deleted'
    else
      flash[:danger] = t 'error.check_logs'
    end
    redirect_to admin_index_path
  end
end
