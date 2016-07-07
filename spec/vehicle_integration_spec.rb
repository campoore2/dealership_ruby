require('capybara/rspec')
require('launchy')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add dealership path', {:type => :feature}) do
  it('takes name of a dealership and name of vehicles and builds list of vehicles available at each dealership') do
    visit('/')
    click_link('Add New Dealership')
    fill_in('name', :with => 'Happy Motors')
    click_button('Add Dealership')
    click_link('Add New Vehicle')
    visit('/')
    click_link('See Dealership List')
    expect(page).to have_content('Happy Motors')
  end
end
