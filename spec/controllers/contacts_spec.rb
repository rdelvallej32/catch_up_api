require 'rails_helper'

RSpec.describe ContactsController do
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

  before(:all) do
    User.create!(user_params)
    Contact.create!(contact_params)
  end

  after(:all) do
    Contact.delete_all
    User.delete_all
  end

  context 'when authenticated' do
    # before(:each) do
    #   post :signup, { credentials: user_params }, format: :json
    #   post :signin, { credentials: user_params }, format: :json
    # end
    before(:each) do
      request.env['HTTP_AUTHORIZATION'] = "Token token=#{user.token}"
    end

    describe 'GET index' do
      before(:each) do
        get :index, format: :json
      end

      it 'is successful' do
        expect(response).to be_successful
      end

      it 'renders a JSON response' do
        contact_response = JSON.parse(response.body)
        expect(contact_response).not_to be_nil
      end
    end

    describe 'GET show' do
      before(:each) do
        get :index, id: contact.id, format: :json
      end

      it 'is successful' do
        expect(response).to be_successful
      end

      it 'renders a JSON response' do
        contact_response = JSON.parse(response.body)
        expect(contact_response).not_to be_nil
      end
    end

    describe 'POST create' do
      before(:each) do
        post :create,
             { contact: contact_params }, format: :json
      end

      it 'is successful' do
        expect(response).to be_successful
      end

      it 'renders a JSON response' do
        contact_response = JSON.parse(response.body)

        expect(contact_response).not_to be_nil
      end
    end

    describe 'PATCH update' do
      def new_contact_params
        { occupation: 'Dean'
        }
      end

      before(:each) do
        patch :update,
              { id: contact.id, contact: new_contact_params },
              format: :json
      end

      it 'is successful' do
        expect(response).to be_successful
      end

      it 'renders a JSON response' do
        contact_response = JSON.parse(response.body)
        expect(contact_response).not_to be_nil
      end
    end

    describe 'DELETE destroy' do
      before(:each) do
        delete :destroy, id: contact.id, format: :json
      end

      it 'is successful' do
        expect(response).to be_success
      end

      it 'renders no response body' do
        expect(response.body).to be_empty
      end
    end
  end
end
