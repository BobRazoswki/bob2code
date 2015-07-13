require 'spec_helper'
#    save_and_open_page
feature 'Create links : ' do
  scenario 'I can create a link on the homepage' do
    visit '/'
    fill_in 'Title', with: 'Bob'
    fill_in 'Url', with: 'http://bob.com'
    click_button 'Bob It !'

    expect(current_path).to eq '/'

    within '.home__ul' do
      expect(page).to have_content 'http://bob.com'
    end

    expect(Link.count).to eq 1

  end
end

feature 'Read links : ' do
  scenario 'I can not see any link' do
    expect(Link.count).to eq 0
  end

  scenario 'I can see existings links on the homepage' do
    Link.create(title: 'Bob2Code', url: 'http://bob2code.io')
    #Here we are Mocking the link

    visit '/'
    #Means that our test is targeting the homepage
    expect(page.status_code).to eq 200
    #Check the different page status !
    within '.home__ul' do
    #Means that our test is targeting inside a css tag
    #If you wonder why I am doing __ and -- inside my css class checkout BEM Css
      expect(page).to have_content('Bob2Code')
      #we expect inside of the css that our value will be there
    end
      expect(Link.count).to eq 1
  end
end

feature 'Update links : ' do
  scenario 'I can update a link' do
    Link.create(title: 'Bob2Code', url: 'http://bob2code.io/test')

    visit ('/')

    expect(page).to have_content 'http://bob2code.io/test'
save_and_open_page
    fill_in 'Title_up', with: 'george'
    click_button('Update')

    expect(page).to have_content 'george'
  end
end

feature 'Delete links : ' do
  scenario 'I can delete a link' do
    Link.create(title: 'Bob2Code', url: 'http://bob2code.io/test')

    visit ('/')

    expect(page).to have_content 'http://bob2code.io/test'

    within '.home__ul' do
      click_button('Destroy')
    end

    expect(page).to_not have_content 'http://bob2code.io/test'
  end
end
