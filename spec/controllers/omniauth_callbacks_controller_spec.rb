require "rails_helper"


RSpec.describe OmniauthCallbacksController, type: :controller do
  describe ".facebook" do
    let(:current_user){FactoryGirl.create :user}

    before(:each) do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
        provider: :facebook,
         uid: "12345",
         info: {
           email: "user@example.com",
           name: "Justin Bieber"
         }
      )
      request.env["devise.mapping"] = Devise.mappings[:user]
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
    end

    describe "#facebook" do
      context "with a new facebook user" do
        it "should authenticate user" do
          get :facebook
          warden.authenticated?(:user).should == true
        end

        it "should set current_user" do
          get :facebook
          subject.current_user.should_not be_nil
        end

        it "should redirect to root_path" do
          get :facebook
          response.should redirect_to(root_path)
        end
      end

      it "make new facebook user" do
        User.stub(:from_omniauth).and_return User.new
        get :facebook
        response.should redirect_to(new_user_registration_url)
      end
    end
  end
end
