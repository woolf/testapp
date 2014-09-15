require 'spec_helper'

describe CollectionsController do
  let(:valid_attributes) {
    user = User.create(:login => "test", :password => "test", :password_confirmation => "test")
    { "name" => "Collection name", :user => user }
  }

  let(:user2) {
    {:login => "test2", :password => "test2", :password_confirmation => "test2"}
  }

  describe "Display collection" do
    it "populates an array of collections" do
      collection = Collection.create!(valid_attributes)
      get :index
      assigns(:collections).should eq([collection])
    end

    it "shows collection details" do
      collection = Collection.create!(valid_attributes)
      get :show, :id => collection.id
      assigns(:collection).should eq(collection)
    end
  end

  describe "Edit collection" do
    it "should not allow to user edit collection details for not signed in user" do
      collection = Collection.create!(valid_attributes)
      get :edit, :id => collection.id
      response.should redirect_to login_users_path
    end

    it "should allow to user's owner edit collection details" do
      collection = Collection.create!(valid_attributes)
      request.session[:logged_in_user] = collection.user.id
      get :edit, :id => collection.id
      assigns(:collection).should eq(collection)
    end

    it "should allow to Owner user update collection details" do
      collection = Collection.create!(valid_attributes)
      request.session[:logged_in_user] = collection.user.id
      put :update, {:id => collection.to_param, :collection => { "name" => "My Collection" }}
      response.should redirect_to collection_path(collection)
    end


    it "should not allow to Not Owner user edit collection details" do
      collection = Collection.create!(valid_attributes)
      not_owner = User.create(user2)
      request.session[:logged_in_user] = not_owner.id
      get :edit, :id => collection.id
      response.should redirect_to collections_path
    end

    it "should not allow to Not Owner user update collection details" do
      collection = Collection.create!(valid_attributes)
      not_owner = User.create(user2)
      request.session[:logged_in_user] = not_owner.id
      put :update, {:id => collection.to_param, :collection => { "name" => "My Collection" }}
      response.should redirect_to collections_path
    end
  end

  describe "Delete collection" do
    it "redirects to the monuments list" do
      collection = Collection.create!(valid_attributes)
      request.session[:logged_in_user] = collection.user.id
      delete :destroy, {:id => collection.to_param}
      response.should redirect_to(my_collections_path)
    end
  end

end
