require "rails_helper"

RSpec.describe User, type: :model do
  it ".email_of_all_admins" do
    user = FactoryGirl.create :user, role: :admin
    User.email_of_all_admins.should include(user)
  end

  context "columns" do
    it{expect have_db_column(:email).of_type(:string)}
    it{expect have_db_column(:name).of_type(:string)}
    it{expect have_db_column(:encrypted_password).of_type(:string)}
    it{expect have_db_column(:avatar).of_type(:string)}
  end
  context "relationship" do
    it{is_expected.to have_many :comments}
    it{is_expected.to have_many :orders}
    it{is_expected.to have_many :requests}
  end

  context "validates" do
    it{expect validate_presence_of :name}
    it{expect validate_presence_of :email}
    it{expect validate_length_of :encrypted_password}
  end

  describe "instance methods" do
    it{expect respond_to :set_default_role}
  end

  describe "check admin" do
    it "it is admin user" do
      user = FactoryGirl.create :user, role: :admin
      expect(user.is_admin_user?).to be true
    end
    it "it is user" do
      user = FactoryGirl.create :user
      expect(user.is_admin_user?).to be false
    end
  end

  auth_hash = OmniAuth::AuthHash.new(
    provider: "facebook",
    uid: "1234",
    info: {
      email: "user@example.com",
      name: "Justin Bieber"
    })
  describe ".from_omniauth" do
    it "retrieves an existing user" do
      user = User.new(
        provider: "facebook",
        uid: "1234",
        email: "user@example.com",
        password: "password",
        password_confirmation: "password"
      )
      user.save
      omniauth_user = User.from_omniauth auth_hash
      expect(user).to eq(omniauth_user)
    end

    it "creates a new user if one doesn't already exist" do
      expect{User.from_omniauth auth_hash}.to change(User, :count).by 1
    end
  end
end
