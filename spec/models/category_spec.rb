require 'spec_helper'

describe Category do
  before(:each) do
    @category = Category.new(:name => "Category name")
    @category.save
  end

  subject { @category }

  it "category should be valid with valid fields" do
    should be_valid
  end

  it "collection should be invalid with empty name" do
    @category.name = nil
    should be_invalid
  end

  it "collection should be invalid if name already exists in database" do
    duplicate_category = Category.new(:name => "Category name")
    duplicate_category.should be_invalid
  end
end
