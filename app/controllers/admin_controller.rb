class AdminController < ApplicationController
  before_action :admin?
  #layout 'admin' - для всех экшенов

  def users_count
    @users_count = User.count
    render layout: 'admin'   # layout для конкретного экшена
  end
end
