module PrimaryLocationsHelper
      
  def skip_link_onclick( letters )
    javascript = "$$( 'li.location' ).invoke( 'hide' );$$( "
    letters.each do | letter |
      javascript << "'li.#{letter}'"
      unless letter == letters.last then javascript << "," end
    end
    javascript << " ).invoke( 'show' );"
  end
  
end
