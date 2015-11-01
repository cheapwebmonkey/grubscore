require 'rails_helper'

describe "businesses/index" do
  before(:each) do
    assign(:businesses, [
      stub_model(Business,
        :name => "Name",
        :address => "Address"
      ),
      stub_model(Business,
        :name => "Name",
        :address => "Address"
      )
    ])
  end

  it "renders a list of businesses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
  end

#   <tbody>
#     <% @businesses.each do |business| %>
#       <tr>
#         <td><%= business.name %></td>
#         <td><%= business.address %></td>
#         <td><%= link_to 'Show', business %></td>
#         <td><%= link_to 'Edit', edit_business_path(business) %></td>
#         <td><%= link_to 'Destroy', business, method: :delete, data: { confirm: 'Are you sure?' } %></td>
#       </tr>
#     <% end %>
#   </tbody>
#   end
# </table>
end
