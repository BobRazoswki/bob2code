
feature 'Viewing links' do
  scenario 'I can see existings links on the homepage' do
    Link.new(url: 'http://bob2code.io', title: 'Bob2Code')
    #Here we are Mocking the link

    visit '/'
    #Means that our test is targeting the homepage
    expect(page.status_code).to eq 200
    #Check the different page status !
    within '.home__ul--li h3' do
    #Means that our test is targeting inside a css tag
    #If you wonder why I am doing __ and -- inside my css class checkout BEM Css
      expect(page).to have_content('Bob2Code')
      #we expect inside of the css that our value will be there
    end

  end
end
