class SearchesController < ApplicationController
    def show
        @search = Search.find(params[:id])
    end 

    def new 
        @search = Search.new
        @cities = Profile.distinct.pluck(:city)
        @sexes = Profile.distinct.pluck(:sex)
    end

    def create
        @search = Profile.create(search_params)
        redirect_to @search
    end 

    private

    def search_params
        params.require(:search).permit(:first_name, :last_name, :sex, :city, :biography, :user_id, :photo)
    end 

end
