class PhotosController < ApplicationController
  before_filter :load_parents
  before_filter :require_logged_in_user, :except => :show

  def new
    @photo = Photo.new(:collection => @collection, :monument => @monument)
  end

  def create
    @photo = Photo.new(params.require(:photo).permit(:image))
    @photo.user = @logged_in_user
    @photo.monument = @monument
    @photo.collection = @collection
    if @photo.save
      flash[:notice] = "Photo successfully added"
      redirect_to collection_monument_photo_path(@collection, @monument, @photo)
    else
      render :new
    end
  end

  def show
    @photo = @monument.photos.find(params[:id])
  end

  def edit
    @photo = @monument.photos.find(params[:id])
  end

  def update
    @photo = @monument.photos.find(params[:id])
    if @photo.update(params.require(:photo).permit(:image))
      flash[:notice] = "Photo successfully updated"
      redirect_to collection_monument_photo_path(@collection, @monument, @photo)
    else
      render :edit
    end
  end

  def destroy
    @photo = @monument.photos.find(params[:id])
    if @photo.destroy
      flash[:notice] = "Photo successfully deleted"
      redirect_to collection_monument_path(@collection, @monument)
    else
      flash[:notice] = "Unable delete photo"
      render :edit
    end
  end

  private
  def load_parents
    @collection = Collection.find_by_id(params[:collection_id])
    @monument   = @collection.monuments.find_by_id(params[:monument_id])
    if @collection.nil? || @monument.nil?
      flash[:notice] = ""
      redirect_to root_path
    end
  end
end
