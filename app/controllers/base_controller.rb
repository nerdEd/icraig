class BaseController < ApplicationController
  
  def index
    @page_title = "iCraig Home"
    session[ :location ] = nil
    session[ :sub_location ] = nil
    session[ :category ] = nil 
    session[ :sub_category ] = nil
  end
  
end
