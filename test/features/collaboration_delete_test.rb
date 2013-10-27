require "test_helper"

feature "Delete a question (collaboration)" do
  scenario "question successfully deleted" do
    # Given
    visit collaborations_path
    page.find("tr:last").click_on "Destroy"
    # Then
    page.has_content?('Are you sure')

    page.text.must_include collaborations(:question01).question
    # page.text.must_include collaborations(:question02).question
    page.text.must_include collaborations(:question03).question
    page.text.must_include collaborations(:question04).question
    page.wont_have_content "Is this an unanswered question"
  end
end
