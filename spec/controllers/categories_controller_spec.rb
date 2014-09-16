require 'spec_helper'

describe CategoriesController do
  let(:signed_in_user) {
    User.create(:login => "test", :password => "test", :password_confirmation => "test")
  }

  describe "Display all categories" do
    it "populates an array of categories" do
      request.session[:logged_in_user] = signed_in_user.id
      category = Category.create!(:name => "Category name")
      get :index
      assigns(:categories).should eq([category])
    end
  end

  describe "Create category" do
    it "should display display category page" do
      request.session[:logged_in_user] = signed_in_user.id
      get :new
      expect(response).to render_template(:new)
    end

    it "should not allow to access not signed in user display category page" do
      get :new
      response.should redirect_to login_users_path
    end

    it "should create category" do
      request.session[:logged_in_user] = signed_in_user.id
      expect {
        post :create, :category => {:name => "Category name"}
      }.to change(Category, :count).by(1)
    end

    it "should create category to anonymous user" do
      post :create, :category => {:name => "Category name"}
      response.should redirect_to login_users_path
    end
  end

  describe "Edit category" do

  end

  describe "Delete category" do

  end
end
