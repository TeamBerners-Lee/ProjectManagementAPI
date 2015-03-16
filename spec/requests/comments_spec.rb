require 'rails_helper'

describe 'Comment Requests' do
  before (:all) do
    Task.destroy_all
    Comment.destroy_all

    @task = Task.create(name: "task 1", privacy: 0)
    @tasks = Task.all

    @comment = Comment.create(body: "I <3 project management!"),
    @comment = Comment.create(body: "I <3 coding"),
    @comment = Comment.create(body: "hooray coding!")
    @task.comments << @comment
    @comments = Comment.all
  end

  describe '#index' do
    it 'it gets all of the comments for each task' do
      get "/tasks/#{@task.id}/comments"
      expect(response).to be_success
      comment = JSON.parse(response.body)
      expect(comment['comments'].length).to eq 3
    end
  end

  describe '#create' do
    it 'creates a new comment for each task' do
      post "/tasks/#{@tasks.first.id}/comments",
      { comment: {
        body: "hooray coding!"
      } }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
      expect(response).to be_success
      expect(response.content_type).to be Mime::JSON
    end
  end

  describe '#destroy' do
    it 'it deletes a comment' do
      comment = @comments.first
      delete "/tasks/#{@tasks.first.id}/comments/#{comment.id}"
      expect(response.status).to eq 204
    end
  end

end
