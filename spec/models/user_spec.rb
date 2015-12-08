require_relative '../../app/models/user'

describe User do
  describe ".find_by_credentials" do

    before(:all) do
      @user = User.new(username: "User 1", password: "password")
      @user.save
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
end
