require 'rails_helper'

RSpec.describe 'Contacts API' do # test for th articles api
  def contact_params
    {
      first_name: 'Henry',
      last_name: 'Holmes',
      occupation: 'Professor',
      professional_relationship: 'Mentor',
      company: 'BU',
      last_contacted: '20120407',
      fact: 'Likes Pizza'
    }
  end

  def contacts
    Contact.all
  end

  def contact
    Contact.first
  end

  def user_params
    {
      email: 'alice@example.com',
      password: 'foobarbaz',
      password_confirmation: 'foobarbaz'
    }
  end

  def user
    User.first
  end

  before(:all) do # before all the test, run method and then create a contact
    User.create!(user_params)
    Contact.create!(contact_params)
  end

  after(:all) do # after the test, run method to delete it
    User.delete_all
    Contact.delete_all
  end

  context 'when authenticated' do
    def headers
      {
        'HTTP_AUTHORIZATION' => "Token token=#{user.token}"
      }
    end

    describe 'GET /contacts' do
      it 'lists all contacts' do
        get '/contacts', headers

        expect(response).to be_success

        contact_response = JSON.parse(response.body)
        p contact_response
        expect(contact_response.length).to eq(contacts.count)
        expect(contact_response['contacts'].first['first_name']).to eq(
          contacts.first.first_name)
      end
    end

    describe 'GET /contacts/:id' do
      it 'shows one contact' do
        # interpolate the contact method
        get "/contacts/#{contact.id}", headers

        expect(response).to be_success
        contact_response = JSON.parse(response.body)
        expect(contact_response['id']).to eq[contact.id]
        expect(contact_response['first_name']).to eq(contact.first_name)
      end
    end

    describe 'POST /contacts' do
      it 'creates an contact' do
        post '/contacts', { contact: contact_params }, headers

        expect(response).to be_success
        contact_response = JSON.parse(response.body)
        expect(contact_response).not_to be_nil
        expect(
          contact_response['first_name']).to eq(contact_params[:first_name])
      end
    end

    describe 'PATCH /contacts/:id' do
      def contact_diff
        { first_name: 'Henry',
          last_name: 'Holmes',
          occupation: 'Dean',
          professional_relationship: 'Mentor',
          company: 'BC',
          last_contacted: '20130507',
          fact: 'Likes Pizza'
        }
      end

      it 'updates an contact' do
        patch "/contacts/#{contact.id}", { contact: contact_diff }, headers

        expect(response).to be_success
        contact_response = JSON.parse(response.body)
        expect(contact_response['id']).to eq(contact.id)
        expect(contact_response['company']).to eq(contact_diff[:company])
      end
    end

    describe 'DELETE /contacts/:id' do
      it 'deletes an contact and response body to be empty' do
        delete "/contacts/#{contact.id}", nil, headers

        expect(response).to be_success
        expect(response.body).to be_empty
      end
    end
  end
end
