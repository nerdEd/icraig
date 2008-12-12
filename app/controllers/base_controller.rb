class BaseController < ApplicationController
  
  def index
    @page_title = "iCraig"
    session[ :location ] = nil
    session[ :sub_location ] = nil
    session[ :category ] = nil 
    session[ :sub_category ] = nil
  end
  
end
