require 'spec_helper'

describe User do

  before(:each) do
    @user = User.new(:login => "test", :password => "test", :password_confirmation => "test")
  end

  subject { @user }

  it "user should not be valid with valid field" do
    should be_valid
  end

  it "user should not be valid with empty fields" do
    @user = User.new
    should be_invalid
  end


  it "user should not be valid with empty password" do
    @user.password = nil
    should_not be_valid
  end

  it "user should not be valid with empty login" do
    @user.login = nil
    should_not be_valid
  end

  it "with a login too short" do
    @user.login = "abc"
    should be_invalid
  end

  it "with a password that's too short" do
    @user.password = @user.password_confirmation = "123"
    should be_invalid
  end

  it "with a password confirmation that missmach password" do
    @user.password = "pass"
    @user.password_confirmation = "no_pass"
    should be_invalid
  end
end
