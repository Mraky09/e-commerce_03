require "rails_helper"

RSpec.describe CategoriesController, type: :controller do
  describe "GET #show/:id" do
    it "get category by id" do
      categrory = double("category")
      allow(Category).to receive(:find) {category}
    end

    it "responds successfully with an HTTP 200 status code" do
      category = Category.new FactoryGirl.attributes_for :category
      category.save!
      get :show, params: {id: category.id}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "search product" do
      category = Category.new FactoryGirl.attributes_for :category
      category.save!
      get :show, params: {id: category.id, q: "a"}
      controller.params[:q].should eql "a"
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "search product have price greater than" do
      category = Category.new FactoryGirl.attributes_for :category
      category.save!
      get :show, params: {id: category.id, q: {price_gteq: "5"}}
      controller.params[:q][:price_gteq].should eql "5"
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "search product have price less than" do
      category = Category.new FactoryGirl.attributes_for :category
      category.save!
      get :show, params: {id: category.id, q: {price_lteq: "5"}}
      controller.params[:q][:price_lteq].should eql "5"
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "search product have price in" do
      category = Category.new FactoryGirl.attributes_for :category
      category.save!
      get :show, params: {id: category.id, q: {price_gteq: "5", price_lteq: "10"}}
      controller.params[:q][:price_gteq].should eql "5"
      controller.params[:q][:price_lteq].should eql "10"
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
