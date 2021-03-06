require 'rails_helper'
RSpec.feature 'User #Show', type: :feature do
  background do
    visit new_user_session_path
    @user1 = User.create(name: 'Sam', bio: 'This is my bio',
                         photo: 'https://steelfoads/', email: 'Sam@gmail.com', password: 'pard', confirmed_at: Time.now)

    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
  end

  scenario 'show number of posts per user' do
    Post.create(title: 'This is post 1', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                author_id: @user1.id)
    Post.create(title: 'This is post 2', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                author_id: @user1.id)

    find("a[href='#{user_path(@user1.id)}']").click
    expect(page).to have_content 'Number of posts:'
  end

  scenario "show user's bio." do
    Post.create(title: 'This is post 3', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                author_id: @user1.id)

    find("a[href='#{user_path(@user1.id)}']").click
    expect(page).to have_content 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  end

  scenario "show user's first 3 posts." do
    Post.create(title: 'Post 4', text: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco ',
                author_id: @user1.id)
    Post.create(title: 'Post 5', text: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco ',
                author_id: @user1.id)
    Post.create(title: 'Post 6', text: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco ',
                author_id: @user1.id)
    Post.create(title: 'Post 7', text: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco ',
                author_id: @user1.id)
    find("a[href='#{user_path(@user1.id)}']").click
    expect(page).to_not have_content 'Excepteur sint occaecat cupidatat non proident'
  end
end
