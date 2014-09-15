require 'spec_helper'

describe MonumentsController do
  let(:valid_attributes) {
    { "name" => "Monument name", :description => "Description", :category_id  => 1 }
  }

  let(:not_valid_attributes) {
    collection = Collection.create(:name => "Collection", :user => @user)
    { "name" => nil, :description => nil, :collection => collection, :categories => nil }
  }

  let(:valid_collection) {
    user = User.create(:login => "test", :password => "test", :password_confirmation => "test")
    Collection.create(:name => "Collection", :user => user)
  }

  let(:second_valid_collection) {
    user = User.create(:login => "test2", :password => "test2", :password_confirmation => "test2")
    Collection.create(:name => "Collection2", :user => user)
  }

  describe "Display monument page" do

    it "should display monument page" do
      monument = Monument.new(valid_attributes)
      monument.collection = valid_collection
      monument.save
      get :show, {:id => monument.id, :collection_id => valid_collection }
      assigns(:monument).should eq(monument)
    end

    it "should have collection assigned only to this monument" do
      monument = Monument.create(valid_attributes)
      monument.collection = valid_collection
      monument.save
      get :show, {:id => monument.id, :collection_id => second_valid_collection }
      assigns(:monument).should eq(nil)
      response.should redirect_to collection_path second_valid_collection
    end
  end

  describe "Create Monument" do
    it "should display create monument page" do
      monument = Monument.new(:collection => valid_collection)
      get :new, :collection_id => monument.collection
      expect(response).to render_template(:new)
    end

    it "should create monument" do
      expect {
        post :create, :collection_id => valid_collection, :monument => valid_attributes
      }.to change(Monument, :count).by(1)
    end

    it "should not create monument with not valid fields" do
      post :create, {:collection_id => valid_collection, :monument => not_valid_attributes}
      response.should render_template(:new)
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
