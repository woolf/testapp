require 'spec_helper'

describe MonumentsController do
  let(:valid_attributes) {
    @user = User.create(:login => "test", :password => "test", :password_confirmation => "test")
    collection = Collection.create(:name => "Collection", :user => @user)
    category = Category.create(:name => "Category name")
    { "name" => "Monument name", :description => "Description", :collection => collection, :category => category }
  }

  let(:valid_collection) {
    user = User.create(:login => "test", :password => "test", :password_confirmation => "test")
    Collection.create(:name => "Collection", :user => user)
  }

  describe "Display monument page" do

    it "should display monument page" do
      monument = Monument.create(valid_attributes)
      get :show, {:id => monument.id, :collection_id => monument.collection }
      assigns(:monument).should eq(monument)
    end

    it "should have collection assigned only to this monument" do
      monument = Monument.create(valid_attributes)
      collection = Collection.create(:name => "Wrong Collection", :user => @user)
      monument.collection = collection
      get :show, {:id => monument.id, :collection_id => monument.collection }
      assigns(:monument).should eq(nil)
      response.should redirect_to collection_path monument.collection
    end
  end

  describe "Create Monument" do
    it "should display create monument page" do
      monument = Monument.new(:collection => valid_collection)
      get :new, :collection_id => monument.collection
    end

    it "should create monument" do

    end
  end

  describe "Edit monument" do
    it "edit should be allowed only to owner of collection" do

    end

    it "update should be allowed only to owner of collection" do

    end

    it "destroy should be allowed only to owner of collection" do

    end
  end

end
