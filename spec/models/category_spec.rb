require "rails_helper"

RSpec.describe Category, type: :model do
  describe "category db schema" do
    context "column" do
      it{expect have_db_column(:name).of_type(:string)}
      it{expect have_db_column(:description).of_type(:text)}
      it{expect have_db_column(:depth).of_type(:integer)}
      it{expect have_db_column(:left).of_type(:integer)}
      it{expect have_db_column(:right).of_type(:integer)}
    end
  end

  describe "validations" do
    context "association" do
      it{is_expected.to have_many :products}
    end

    context "validates" do
      it{expect validate_presence_of :name}
      it{expect validate_uniqueness_of :name}
      it{expect validate_length_of(:name).is_at_most(150)}
    end
  end

  describe "category instance method" do
    subject{Category.first}
    it ".leaf?" do
      expect(subject.leaf?).to be false
    end
    it ".delete_category" do
      expect(subject.delete_category).to be_an Integer
    end
    it ".update_category" do
      expect(subject.update_category "2").to be true
    end
    it ".update greater than parent category" do
      expect(subject.update_category "").to be true
    end
  end
end
