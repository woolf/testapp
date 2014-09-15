require 'spec_helper'

describe Collection do

  before(:each) do
    user = User.new(:login => "test", :password => "test", :password_confirmation => "test")
    user.save
    @collection = Collection.new(:name => "Collection name")
    @collection.user = user
  end

  subject { @collection }

  it "collection should be valid with valid fields" do
    should be_valid
  end

  it "collection should be invalid with empty name" do
    @collection.name = nil
    should be_invalid
  end

  it "collection should be invalid if user not assigned to it" do
    @collection.user = nil
    should be_invalid
  end
end
