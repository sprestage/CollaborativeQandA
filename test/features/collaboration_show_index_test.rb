require "test_helper"

feature "Show index of collaborations." do
  scenario "all collaborations are displayed" do
    # Given
    # When
    visit collaborations_path
    # Then
    page.text.must_include 'Is this a question?'
    page.text.must_include 'Is there a trap here?'
  end
end
