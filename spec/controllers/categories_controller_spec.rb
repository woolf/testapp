require 'spec_helper'

describe CategoriesController do
  describe "Display all categories" do
    it "populates an array of categories" do
      category = Category.create!(:name => "Category name")
      get :index
      assigns(:categories).should eq([category])
    end
  end

  describe "Edit category" do

  end

  describe "Delete category" do

  end
end
