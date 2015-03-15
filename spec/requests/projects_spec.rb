require 'rails_helper'

describe 'Project Requests' do
  before(:all) do
    Project.destroy_all
    @project1 = Project.create(name: "Project 1", privacy: 0)
    @project2 = Project.create(name: "Project 2", privacy: 0)
    @project3 = Project.create(name: "Project 3", privacy: 0)
    @projects = Project.all
  end

  describe '#index' do
    it 'gets all of the projects' do
      get '/projects'
      expect(response).to be_success
      project = JSON.parse(response.body)
      expect(project['projects'].length).to eq 3
    end
  end

  describe '#create' do
    it 'should create a new project and return it' do
      post '/projects',
      { project: {
          name: "Ultricies Vulputate Risus",
          description: "Donec sed odio dui.",
          due_date: DateTime.new(2015,3,19,9),
          privacy: false
        } }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

      project = JSON.parse(response.body)
      expect(project['project']['name']).to eq "Ultricies Vulputate Risus"
    end
  end

   describe '#show' do
    it 'should retrieve a single project by id and return json' do
      @project = @projects.first
      get "/projects/#{@project.id}"
      expect(response).to be_success

      project = JSON.parse(response.body)
      expect(project['project']['name']).to eq @project.name
    end
  end

  describe '#update' do
    it 'should update the parameters of the project and return that project' do
      @project = @projects.first

      put "/projects/#{@project.id}",
      { project: {
          name: "Ultricies Vulputate Risus",
          description: "Updating the description to something else"
        }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

      expect(response).to be_success
      expect(response.content_type).to be Mime::JSON

      project = JSON.parse(response.body)
      expect(project['project']['name']).to eq "Ultricies Vulputate Risus"
    end
  end

  describe '#destroy' do
    it 'should kill the project' do
      project = @projects.first
      delete "/projects/#{project.id}"
      expect(response.status).to eq 204
    end
  end

end
