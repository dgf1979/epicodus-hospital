require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('doctor office', {:type => :feature}) do
  it('adds a doctor') do
    visit('/doctors/new')
    fill_in('name', :with => 'Doogie Houser')
    select('Family Medicine', :from => "specialty")
    click_button('Add Doctor')
    expect(page).to have_content('Doogie Houser')
  end
end



# As an administrator, I want to add a doctor to the database with a name and specialty.
# As an administrator, I want to add a patient with their name and birthdate.
# As an administrator, I want to be able to assign a patient to a doctor for care.
# As a doctor, I want to see the list of patients that have been assigned to me.
# As a patient, I want to see a list of all the doctors in a particular specialty.
# As an administrator, I want to view an alphabetical list of doctors inc the # of patients they see.
