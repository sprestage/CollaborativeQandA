require "test_helper"

feature "Update a question or answer of a collaboration." do
  scenario "collaboration successfully updated" do
    # Given
    visit collaborations_path
    click_on 'New Q & A Collaboration'
    fill_in "Question", with: collaborations(:question02).question
    fill_in "Answer", with: collaborations(:question02).answer
    click_on "Create Collaboration"
    click_on 'Edit'
    fill_in "Question", with: collaborations(:question03).question
    fill_in "Answer", with: collaborations(:question03).answer
    # When
    click_on 'Update Collaboration'
    # Then
    page.text.must_include collaborations(:question03).question
    page.text.must_include collaborations(:question03).answer
    # And
    page.text.must_include "Collaboration was successfully updated"
  end
end
