require_relative '../../app/models/user'
require 'pry'

describe User do
  describe ".find_by_credentials" do

    before(:all) do
      @user = User.new(username: "User 1", password: "password")
      @user.save
    end

    after(:all) do
      @user.destroy
    end

    it "returns nil when given incorrect password" do
      result = User.find_by_credentials(@user.username, "wrong_password")
      expect(result).to be_nil
    end

    it "returns nil when given incorrect username" do
      result = User.find_by_credentials("wrong_username", @user.password)
      expect(result).to be_nil
    end

    it "returns the correct user for given credentials" do
      result = User.find_by_credentials(@user.username, @user.password)
      expect(result.username).to eq(@user.username)
    end
  end

  describe "#initialize" do
    before(:all) do
      @user = User.new(username: "User 1", password: "password")
    end

    after(:all) do
      @user.destroy
    end

    it "creates a session token" do
      expect(@user).to_not be_nil
    end
  end

  describe "#password=" do
    before(:all) do
      @user = User.new(username: "User 1", password: "password")
      @user.password = "password"
    end

    after(:all) do
      @user.destroy
    end

    it "sets a @password instance variable on user" do
      expect(@user.password).to eq("password")
    end

    it "sets the password_digest attribute" do
      expect(@user.password_digest).to_not be_nil
    end

    it "does not set password and password_digest to the same value" do
      expect(@user.password_digest).not_to eql(@user.password)
    end
  end

  describe "#valid_password?" do
    before(:all) do
      @user = User.new(username: "User 1", password: "password")
    end

    after(:all) do
      @user.destroy
    end

    it "is true when passed the correct password" do
      expect(@user.valid_password?("password")).to be true
    end

    it "is false when passed the incorrect password" do
      expect(@user.valid_password?("not_password")).to be false
    end

    it "is false when passed nil" do
      expect(@user.valid_password?(nil)).to be false
    end
  end

  describe "#reset_session_token!" do
    before(:all) do
      @user = User.new(username: "User 1", password: "password")
    end

    after(:all) do
      @user.destroy
    end

    it "changes the session token" do
      old_session_token = @user.session_token
      @user.reset_session_token!
      expect(@user.session_token).not_to eql(old_session_token)
    end
  end
end
