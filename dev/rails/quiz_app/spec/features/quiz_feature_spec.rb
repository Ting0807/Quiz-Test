require 'spec_helper'

def create_quiz(some_title)
  Quiz.create({:title => some_title})
end

describe 'the quizzes section' do

  before(:all) do
    create_quiz 'Some quiz'
  end

describe 'the quizzes page' do
  it 'should display quizzes' do
    create_quiz 'Some quiz'
    visit '/quizzes'

    expect(page).to have_content 'Some quiz'
  end
end


# as create_quiz is all the pre-condion of all the test, 
# we use 
	 # before(:all) do
	 #    create_quiz 'Some quiz'
	 #  end

# also create a big section, the quizzes section to be more organised

describe 'an individual quiz' do

	 it 'has its own page' do
		  visit '/quizzes'
		  click_link 'Some quiz' 

		  expect(page).to have_css 'h1', text: 'Some quiz'
	end	  
end 

describe 'new quiz form' do
    it 'creates a new quiz' do
      visit '/quizzes/new'

      within '.new_quiz' do
        fill_in 'Title', with: 'Brand new quiz'
        click_button "Create Quiz"
      end

      expect(current_url).to eq url_for(Quiz.last)
      expect(page).to have_content 'Brand new quiz'
    end
  end

end 