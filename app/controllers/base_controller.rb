class BaseController < ApplicationController
  
  def index
    @page_title = "iCraig Home"
    session[ primary_location ] = nil
    session[ sub_location ] = nil
    session[ primary_category ] = nil
    session[ sub_category ] = nil
  end
  
end
