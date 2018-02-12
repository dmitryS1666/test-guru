class UsersController < ApplicationController

  before_action :authenticate_user!, expect: :index

  def badges
    @badges = current_user.badges
  end

end
