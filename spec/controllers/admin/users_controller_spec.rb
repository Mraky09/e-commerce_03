require "rails_helper"
RSpec.describe Admin::UsersController, type: :controller do
  describe "GET #index" do
    before(:each) do
      sign_in
    end

    it "populates an array of users" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "search user" do
      get :index, params: {q: "a"}
      controller.params[:q].should eql "a"
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("admin/users/index")
    end
  end
end
