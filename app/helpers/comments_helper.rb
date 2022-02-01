module CommentsHelper
    require 'httparty'
        
    def forditasxyz(text)
          HTTParty.get('http://gtav.forditas.xyz/api.php?s=' + text).html_safe
        
    end
end
