require 'rails_helper'

feature 'Creating posts' do
  scenario 'Can create a post with a caption' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/puppy.jpg")
    fill_in 'Caption', with: 'I <3 puppies'
    click_button 'Create Post'
    expect(page).to have_content('puppies')
    expect(page).to have_css("img[src*='puppy.jpg']")
  end

  it 'needs an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: "Fuck pictures I'm fabulous with the written word"
    click_button 'Create Post'
    expect(page).to have_content("Please upload an image with your post!")
  end

end
