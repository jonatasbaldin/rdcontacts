class BaseController < ApplicationController
  def index
    @page_title = "Keep your contacts with us!"
  end

  def about
    @page_title = "About"
  end
end
