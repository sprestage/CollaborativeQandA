require "test_helper"

feature "Show single collaboration." do
  scenario "single collaboration is displayed" do
    # Given
    # When
    visit collaboration_path(collaborations(:question01))
    # Then
    page.text.must_include 'Is this a question?'
    page.text.must_include 'This may be an answer.'
    page.wont_have_content 'Not yet a question or answer'
  end
end
