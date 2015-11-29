require 'rails_helper'

feature 'Editing posts' do
  background do
    job = create(:post)
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end
  scenario 'Can edit a post' do
    fill_in 'Caption', with: "I deleted all my hashtags because I'm basic"
    click_button 'Update Post'
    expect(page).to have_content("Post has been updated")
    expect(page).to have_content("I deleted all my hashtags because I'm basic")
  end

  it "won't update a post without an image" do
    attach_file('Image', 'spec/files/images/puppy.zip')
    click_button 'Update Post'
    expect(page).to have_content("Something is wrong with your upload!")
  end

end
