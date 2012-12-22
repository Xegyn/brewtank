require "spec_helper"

describe UsersController do
  describe "routing" do

    it "routes to sign_in" do
      get("/users/sign_in").should route_to("devise/sessions#new")
    end

    it "routes to sign_up" do
      get("/users/sign_up").should route_to("devise/registrations#new")
    end

  end
end
