class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_is_required
    if !current_user.admin?
      flash[:alert] = "抱歉 您没有权限查看此页面"
      redirect_to root_path
    end
  end
end
