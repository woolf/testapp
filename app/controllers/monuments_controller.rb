class MonumentsController < ApplicationController

  before_filter :load_collection
  before_filter :load_monument, :only => [:show, :edit, :update, :destroy]

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

  end

  def edit

  end

  def update
    @monument.attributes = params.require(:monument).permit(:name, :description, :category_id)
    if @monument.save
      flash[:notice] = "Monument updated successfully"
      redirect_to collection_monument_path(@monument.collection, @monument)
    else
      render :edit
    end
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

  def load_monument
    @monument = @collection.monuments.find_by_id(params[:id])
    if @monument.nil?
      redirect_to collection_path(params[:collection_id])
    end
  end
end
