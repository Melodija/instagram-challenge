require 'rails_helper'

feature 'Editing Posts' do
  scenario 'should be able to edit the post' do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    click_link 'Edit Post'
    fill_in 'Caption', with: 'Oops!'
    click_button 'Update Post'
    expect(page).to have_content 'Post updated'
    expect(page).to have_content 'Oops!'
  end
end
