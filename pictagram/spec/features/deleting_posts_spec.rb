require 'rails_helper'

feature 'Deleting posts' do
  scenario 'Can delete a post' do
    post = create(:post, caption: 'Wooow')

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    click_link 'Edit Post'
    click_link 'Delete Post'
    expect(current_path).to eq '/posts'
    expect(page).to have_content 'Post deleted'
    expect(page).not_to have_content 'Wooow'
  end
end
