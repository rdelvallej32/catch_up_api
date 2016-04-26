require 'rails_helper'

RSpec.describe 'Contacts API' do # test for th articles api
  def contact_params
    {
      content: 'You won\'t believe what happens next...'
    }
  end

  def comments
    Comment.all
  end

  def comment
    Comment.first
  end

  before(:all) do # before all the test, run method and then create an article
    Comment.create!(comment_params)
  end

  after(:all) do # after the test, run method to delete it
    Comment.delete_all
  end

  describe 'GET /comments' do
    it 'lists all comments' do
      get '/comments'

      expect(response).to be_success

      comment_response = JSON.parse(response.body)
      expect(comment_response.length).to eq(comments.count)
      expect(comment_response.first['content']).to eq(comment['content'])
    end
  end

  describe 'GET /comments/:id' do
    it 'shows one comment' do
      # interpolate the comment method
      get "/comments/#{comment.id}", comment: comment_params, format: :json

      expect(response).to be_success
      comment_response = JSON.parse(response.body)
      expect(comment_response).not_to be_nil
      expect(comment_response['content']).to eq(comment_params[:content])
    end
  end

  describe 'POST /comments' do
    it 'creates an comment' do
      post '/comments', comment: comment_params, format: :json

      expect(response).to be_success
      comment_response = JSON.parse(response.body)
      expect(comment_response).not_to be_nil
      expect(comment_response['content']).to eq(comment_params[:content])
    end
  end

  describe 'PATCH /comments/:id' do
    def comment_diff
      { comment: 'Two Stupid Tricks' }
    end

    it 'updates an comment' do
      patch "/comments/#{comment.id}", comment: comment_diff, format: :json

      expect(response).to be_success
      comment_response = JSON.parse(response.body)
      expect(comment_response).not_to be_nil
      expect(comment_response['content']).to eq(comment_params[:content])
    end
  end

  describe 'DELETE /comments/:id' do
    it 'deletes an comment and response body to be empty' do
      delete "/comments/#{comment.id}"

      expect(response).to be_success
      expect(response.body).to be_empty
    end
  end
end
