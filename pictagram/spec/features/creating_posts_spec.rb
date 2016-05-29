require 'rails_helper'

feature 'Creating Posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    page.attach_file("Image", "spec/files/images/children_and_candles.jpg")
    fill_in 'Caption', with: 'Aww #supercute'
    click_button 'Create Post'
    expect(page).to have_content '#supercute'
    expect(page).to have_css("img[src*='children_and_candles.jpg']")
  end

  it 'needs an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'Aww #supercute'
    click_button 'Create Post'
    expect(page).to have_content "Image can't be blank"
  end
end
