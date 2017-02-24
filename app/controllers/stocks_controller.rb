class StocksController < ApplicationController
    
    def search 
        if params[:stock]
            @stock = Stock.find_by_ticker(params[:stock])
            @stock ||= Stock.new_from_lookup(params[:stock])
            # if looked up already it iwll be in @stock, if not ||= then call DB
        end
        
        if @stock 
            # render json: @stock
            # json is a simple way to render out an instance variable for viewing
            render partial: 'lookup'
        else 
            render status: :not_found, nothing: true
        end
    end
    
end
