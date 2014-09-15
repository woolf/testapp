class MonumentsController < ApplicationController

  before_filter :load_collection

  def new
    @monument = Monument.new(:collection => @collection)
  end

  def create
    @monument = Monument.new(params.require(:monument).permit(:name, :description, :category_id))
    @monument.collection = @collection
    if @monument.save
      redirect_to collection_monument_path(@collection, @monument)
    else
      render :new
    end
  end

  def show
    @monument = @collection.monuments.find_by_id(params[:id])
    if @monument.nil?
      redirect_to collection_path(params[:collection_id])
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def load_collection
    @collection = Collection.find_by_id(params[:collection_id])
    if @collection.nil?
      redirect_to collections_path
    end
  end
end
