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
    fill_in('make', :with => 'Tesla')
    fill_in('model', :with => '3')
    fill_in('year', :with => 2016)
    fill_in('color', :with => 'chameleon')
    fill_in('engine_size', :with => '44 kWh')
    fill_in('number_of_doors', :with => '4')
    click_button('Add Vehicle')
    click_link('See Vehicle List')
    expect(page).to have_content('Tesla')
    visit('/')
    click_link('See Dealership List')
    expect(page).to have_content('Happy Motors')
  end
end
