require 'rails_helper'

RSpec.describe 'routes for contacts' do
  it 'routes GET /contacts to the contacts#index action' do
    expect(get('/contacts')).to route_to('contacts#index')
  end

  it 'routes GET /contacts/:id to the contacts#show action' do
    expect(get('/contacts/1')).to route_to(
      controller: 'contacts',
      action: 'show',
      id: '1'
    )
  end

  it 'routes POST /contacts to the contacts#create action' do
    expect(post('/contacts')).to route_to('contacts#create')
  end

  it 'routes PATCH /contacts/:id to the contacts#update action' do
    expect(patch('/contacts/1')).to route_to(
      controller: 'contacts',
      action: 'update',
      id: '1'
    )
  end

  it 'routes DELETE /contacts/:id to the contacts#destroy action' do
    expect(delete('/contacts/1')).to route_to(
      controller: 'contacts',
      action: 'destroy',
      id: '1'
    )
  end
end
