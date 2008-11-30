class BaseController < ApplicationController
  
  def index
    @page_title = "iCraig Home"
    session.clear
  end
  
end
