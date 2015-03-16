require 'rails_helper'

describe 'User Requests' do
  before (:all) do
    User.destroy_all
    @user1 = User.create(username: 'Annie', password: '123')
    @user2 = User.create(username: 'Kelly', password: '1234')
    @user3 = User.create(username: 'Pat', password: '12345')
    @users = User.all
  end

  # describe '#sign_in' do
  #   it 'allows users to sign into the site' do
  #     post "/users/sign_in"
  #     expect(response).to be_success
  #     user = JSON.parse(response.body)
  #   end
  # end

  describe '#index' do
    it 'gets all of the users' do
      get "/users"
      expect(response).to be_success
      user = JSON.parse(response.body)
      expect(user['users'].length).to eq 3
    end
  end

  describe '#create' do
    it 'should create a new user' do
    post "/users",
    { user: {
      username: "Annie", password: '123'
    } }.to_json,
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    expect(response).to be_success
    expect(response.content_type).to be Mime::JSON
    end
  end

  describe '#show' do
    it 'should retrive a single user and what projects they are working on' do
    @user = @users.first
    get "/users/#{@user.id}"
    expect(response).to be_success

    user = JSON.parse(response.body)
    expect(user['user']['username']).to eq @user.username
    end
  end

  describe '#update' do
    it 'should update the users information' do
      @user = @users.second
    put "/users/#{@user.id}",
    { user: {
        username: "Kelli",
        token: "insert_token_here"
      } }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
      expect(response).to be_success
      expect(response.content_type).to be Mime::JSON
    end
  end

end




