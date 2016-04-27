require 'rails_helper'

RSpec.describe ContactsController do
  def contact_params
    {
      first_name: 'Henry',
      last_name: 'Holmes',
      occupation: 'Professor',
      professional_relationship: 'Mentor',
      company: 'BU',
      last_contacted: '2012_04_07',
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

  describe 'GET index' do
    before(:each) { get :index }
    it 'is succesful' do
      expect(response.status).to be_success
    end

    it 'renders a JSON response' do
      contact_response = JSON.parse(response.body)
      expect(contact_response).not_to be_nil
    end
  end

  describe 'GET show' do
    it 'is successful' do
      get :show, id: contact.id

      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      get :show, id: contact.id

      contact_response = JSON.parse(response.body)
      expect(contact_response).not_to be_nil
    end
  end

  context 'when authenticated' do
    before(:each) do
      post :signup, { credentials: user_params }, format: :json
      post :signin, { credentials: user_params }, format: :json

      @token = JSON.parse(response.body)['user']['token']
      request.env['HTTP_AUTHORIZATION'] = "Token token=#{@token}"

      @user_id = JSON.parse(response.body)['user']['id']
    end

    describe 'PATCH changepw' do
      def new_password_params
        {
          old: 'foobarbaz',
          new: 'foobarbazqux'
        }
      end

      before(:each) do
        patch :changepw,
              { id: @user_id, passwords: new_password_params },
              format: :json
      end

      it 'is successful' do
        expect(response).to be_successful
      end

      it 'renders no response body' do
        expect(response.body).to be_empty
      end
    end

    describe 'DELETE signout' do
      before(:each) do
        delete :signout, id: @user_id, format: :json
      end

      it 'is successful' do
        expect(response).to be_successful
      end

      it 'renders no response body' do
        expect(response.body).to be_empty
      end
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
        get :index, id: @user_id, format: :json
      end

      it 'is successful' do
        expect(response).to be_successful
      end

      it 'renders a JSON response' do
        contact_response = JSON.parse(response.body)
        expect(contact_response).not_to be_nil
      end
    end
  end
end
