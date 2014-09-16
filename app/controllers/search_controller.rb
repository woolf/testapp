class SearchController < ApplicationController
  def index
    unless params[:q].empty?
      @monuments = Monument.where("name LIKE ?", "%#{params[:q]}%")
    else
      @monuments = []
    end

  end
end
