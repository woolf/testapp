require 'spec_helper'

describe Monument do
  before(:each) do
    category = Category.create(:name => "Category name")
    user = User.create(:login => "test", :password => "test", :password_confirmation => "test")
    collection = Collection.create(:name => "Collection name", :user => user)
    @monument = Monument.new(:name => "Monument name", :description => "Description", :category => category, :collection => collection)
    @monument.save
  end

  subject { @monument }

  it "monument should be valid with valid fields" do
    should be_valid
  end

  it "monument should be invalid with empty name" do
    @monument.name = nil
    should be_invalid
  end

  it "monument should be invalid if category is not assigned" do
    @monument.category = nil
    should be_invalid
  end

  it "monument should be invalid if collection is not assigned" do
    @monument.collection = nil
    should be_invalid
  end
end
