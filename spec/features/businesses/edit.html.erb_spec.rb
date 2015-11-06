require 'rails_helper'

describe "businesses/edit" do
  before(:each) do
    @business = assign(:business, stub_model(Business,
      :name => "MyString",
      :address => "MyText"
    ))
  end

  it "renders the edit business form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", business_path(@business), "post" do
      assert_select "input#business_name[name=?]", "business[name]"
      assert_select "textarea#business_address[name=?]", "business[address]"
    end
  end
end
