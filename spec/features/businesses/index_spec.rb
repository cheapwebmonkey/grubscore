require 'rails_helper'

describe "Viewing businesses" do
  let!(:business) { Business.create(name: "Name", address: "Address") }

  def visit_business(business)
    visit "/businesses"
    within "#business_#{business.id}" do
      click_link "Add New Business"
    end
  end
  
  it "displays the name of the business" do
    visit_business(business)
    within("h1") do
      expect(page).to have_content(business.name)
    end
  end  

  it "displays no items empty" do
    visit_business(business)
    expect(page.all("ul.business li").size).to eq(0)
  end

  it "displays item content when a business has a name" do
    business.name.create(content: "Name")
    # todo_list.todo_items.create(content: "Eggs")
    
    visit_business(business)
    
    expect(page.all("ul.businesses li").size).to eq(2)
    
    within "ul.business" do
      expect(page).to have_content("Name")
      # expect(page).to have_content("Eggs")
    end
  end
end