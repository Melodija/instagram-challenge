require 'rails_helper'
require 'spec_helper'

feature 'Index shows all posts' do
  scenario 'the index displays multiple posts' do
    create(:post, caption: "This is the first post")
    create(:post, caption: "This is the second post")

    visit '/'
    expect(page).to have_content("This is the first post")
    expect(page).to have_content("This is the second post")
    expect(page).to have_css("img[src*='children_and_candles']")
  end
end

feature 'Can view individual posts' do
  scenario 'Can click and view a single post' do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    expect(current_path).to eq(post_path(post))
  end
end
