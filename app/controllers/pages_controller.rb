class PagesController < ApplicationController
  skip_before_action :require_user
  
  def home
  end

  def about
  end
end
