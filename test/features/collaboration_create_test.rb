require "test_helper"

feature "Create a question (collaboration)" do
  scenario "question successfully created" do
    # Given
    visit new_collaboration_path
    fill_in "Question", with: collaborations(:question01).question
    fill_in "Answer", with: collaborations(:question01).answer
    # When
    click_on "Create Collaboration"
    # Then
    page.text.must_include "Collaboration was successfully created"
    page.text.must_include collaborations(:question01).question
    page.text.must_include collaborations(:question01).answer
  end
end
