class SearchesController < ApplicationController
    def show
        # Searches the Search database for the params by :id
        @search = Search.find(params[:id])
    end 

    def new 
        # Instance variable for a creating a new search
        @search = Search.new
        # Pluck/filter for the city selected by the user
        @cities = Profile.distinct.pluck(:city)
        # Pluck/filter for the gender selected by the user
        @sexes = Profile.distinct.pluck(:sex)
    end

    def create
        @search = Search.create(search_params)
        redirect_to @search
    end 

    private

    def search_params
        # Setting the permitted params for making a search
        params.require(:search).permit(:first_name, :sex, :city)
    end 

end
