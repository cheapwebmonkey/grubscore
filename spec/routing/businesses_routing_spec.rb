require "rails_helper"

describe BusinessesController do
  describe "routing" do

    it "routes to #index" do
      get("/businesses").should route_to("businesses#index")
    end

    it "routes to #new" do
      get("/businesses/new").should route_to("businesses#new")
    end

    it "routes to #show" do
      get("/businesses/1").should route_to("businesses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/businesses/1/edit").should route_to("businesses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/businesses").should route_to("businesses#create")
    end

    it "routes to #update" do
      put("/businesses/1").should route_to("businesses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/businesses/1").should route_to("businesses#destroy", :id => "1")
    end

  end
end
