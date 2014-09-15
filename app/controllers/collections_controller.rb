class CollectionsController < ApplicationController
  before_filter :require_logged_in_user, :except => [:show, :index]
  before_filter :get_user_ownered_collection, :only => [:edit, :update, :destroy]

  def my
    @collections = @logged_in_user.collections
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(params.require(:collection).permit(:name))
    @collection.user = @logged_in_user
    if @collection.save
      redirect_to collection_path(@collection)
    else
      render :new
    end
  end

  def index
    @collections = Collection.all
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def edit
  end

  def update
    if @collection.update(params.require(:collection).permit(:name))
      flash[:notice] = "Collection updated"
      redirect_to collection_path(@collection)
    else
      render :action => "edit"
    end
  end

  def destroy
    #assume that @collection verified if logged in user is owner of this collection by get_user_ownered_collection
    @collection.destroy
    flash[:notice] = "Collection deleted"
    redirect_to my_collections_path
  end

  private
  def get_user_ownered_collection
    @collection = @logged_in_user.collections.where(:id => params[:id]).first
    if @collection.nil?
      redirect_to collections_path
    end
  end
end
