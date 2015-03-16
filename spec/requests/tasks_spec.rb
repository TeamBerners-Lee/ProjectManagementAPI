require 'rails_helper'

describe 'Task Requests' do
  before (:all) do
    Project.destroy_all
    Task.destroy_all

   @project = Project.create(name: "Project 1", privacy: 0)
   @projects = Project.all

  @task = Task.create(name: "task 1", privacy: 0)
    # @task3 = Task.create(name: "task 3", privacy: false)
    @project.tasks << @task
    @tasks = Task.all
  end

  describe '#index' do
    it 'gets all of the tasks for each project' do
      get "/projects/#{@project.id}/tasks"
      expect(response).to be_success
      task = JSON.parse(response.body)
      expect(task['tasks'].length).to eq 1
    end
  end

  describe '#create' do
    it 'creates a new task for each project' do
        post "/projects/#{@projects.first.id}/tasks",
        { task: {
          name: "task 1",
          due_date: DateTime.new(2015,3,17,9),
          status: "staged",
          priority: "high",
          order: 1,
          privacy: false
        } }.to_json,
        { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
        expect(response).to be_success
        expect(response.content_type).to be Mime::JSON
      end
    end


  describe '#show' do
    it 'should show a single task by the particular id number and return the json' do
        task = @tasks.last
        get "/tasks/#{@tasks.first.id}"
        expect(response).to be_success
    end
  end

  describe '#update' do
    it 'should edit and update the task by the id number and return json' do
      put "/tasks/#{@tasks.first.id}",
      { task: {
        name: "task 1",
        due_date: DateTime.new(2015,3,17,9),
        status: "completed",
        priority: "low",
        order: 1,
        privacy: false
      } }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
      expect(response).to be_success
      expect(response.content_type).to be Mime::JSON
    end
  end

  describe '#destroy' do
    it 'it deletes a task' do
      task = @tasks.last
      delete "/tasks/#{@task.id}"
      expect(response.status).to eq 204
    end
  end

end







