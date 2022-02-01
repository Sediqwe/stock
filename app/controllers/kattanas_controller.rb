class KattanasController < ApplicationController
    require 'httparty'
    def start
        render plain: HTTParty.get('http://gtav.forditas.xyz/api.php?type='+ params[:type] +'&s='+ URI.encode(params[:s])).html_safe
    end
    
end
