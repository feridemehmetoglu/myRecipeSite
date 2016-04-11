class HomeController < ApplicationController

  def index
  	if current_user
  		redirect_to recipes_path
  	end
  end
end
