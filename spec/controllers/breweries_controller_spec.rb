require "spec_helper"

describe BreweriesController do
  before do
    @user = FactoryGirl.create :user
    @admin = FactoryGirl.create :admin
    @brewery = FactoryGirl.create :brewery
  end
  context "non-logged in user" do
    it "should allow access to the index" do
      get :index
      response.should render_template("index")
    end
    it "should not allow a user to create" do
      get :new
      response.should_not render_template("new")
    end
    it "should not allow a user to edit" do
      get :edit, :id => @brewery.id
      response.should_not render_template("edit")
    end
  end
  context "logged in user" do
    before do
      sign_in @user
    end
    it "should allow access to the index" do
      get :index
      response.should render_template("index")
    end
    it "should not allow a user to create" do
      get :new
      response.should_not render_template("new")
    end
    it "should not allow a user to edit" do
      get :edit, :id => @brewery.id
      response.should_not render_template("edit")
    end
  end
  context "logged in admin" do
    before do
      sign_in @admin
    end
    it "should allow access to the index" do
      get :index
      response.should render_template("index")
    end
    it "should not allow a user to create" do
      get :new
      response.should render_template("new")
    end
    it "should not allow a user to edit" do
      get :edit, :id => @brewery.id
      response.should render_template("edit")
    end
  end
end