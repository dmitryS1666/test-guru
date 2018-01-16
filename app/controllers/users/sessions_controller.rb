class Users::SessionsController < Devise::SessionsController

  def create
    super do |user|
      flash[:notice] = "Hello, #{current_user.full_name}"
    end
  end

end