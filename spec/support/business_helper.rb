module BusinessesHelpers
  def visit_business(inspections)
    visit "/busnesses"
    within dom_id_for(inspections) do
      click_link "Add New Business"
    end
  end
end