require 'rails_helper'

feature 'Deleting posts' do
  background do
    post = create(:post, caption: 'I hate cats')
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end
  scenario 'Can delete a single post' do
    click_link 'Delete Post'
    expect(page).to have_content('Post has been deleted')
    expect(page).to_not have_content('I hate cats')
  end
end  
