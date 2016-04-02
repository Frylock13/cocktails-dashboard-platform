require 'spec_helper'

describe 'Styles' do
  it 'checks title on index page' do
    visit '/styles'
    expect(page).to have_content 'All styles'
  end

  it 'checks show page with friendly_id' do
    Style.create(name: 'American')
    visit '/styles/american'
    expect(page).to have_selector('h1', 'American')
  end
end