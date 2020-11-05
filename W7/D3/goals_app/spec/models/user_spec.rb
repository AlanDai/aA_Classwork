require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  subject!(:user) do
    User.create(username: 'alan', password: 'appacademy')
  end

  # validations: :username (presence, uniqueness), :session_token (p, u),
  #              :password (length, allow_nil)
  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:session_token) }
    it { should validate_uniqueness_of(:session_token) }
    it { should allow_value(nil).for(:password)}
    it { should validate_length_of(:password).is_at_least(6)}
  end

  # associations: :chirps, :likes, :liked_chirps
  describe "associations" do
    it { should have_many(:goals) }
    it { should have_many(:cheers_given) }
    it { should have_many(:cheers_received).through(:goals) }
  end

  describe "#is_password?" do
    context "when the password is valid" do
      it "should return true" do
        expect(user.is_password?("appacademy")).to be true
      end
    end

    context "when the password is invalid" do
      it "should return false" do
        expect(user.is_password?("walkerschair")).to be false
      end
    end
  end

  describe "::find_by_credentials" do
    # let(:valid_user) {User.create(user: {username:"nico", password: "codewalkers"})}
    describe "when user with given username is in the database" do

      context "when given a valid password" do
        it "should return the user with the given username and password" do
          expect(User.find_by_credentials("alan", "appacademy")).to eq(user)
        end
      end

      context "when given an invalid password" do
        it "should return nil" do
          expect(User.find_by_credentials("alan", "hackreactor")).to be_nil
        end
      end
    end

    context "when user with given username is not in the database" do
      it "should return nil" do
        expect(User.find_by_credentials("niko", "appacademy")).to be_nil
      end
    end

    # methods: #password=, #is_password?, reset_session_token!
    #          #ensure_session_token

  end

  
end
