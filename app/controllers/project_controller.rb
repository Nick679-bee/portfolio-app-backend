class ProjectController < AppController

    set :views, './app/views'

    # @method: Display a small welcome message
    get '/hello' do
        "Our very first controller"
    end

    # @method: Add a new PROJECTS to the DB
    post '/project/create' do
        begin
            project = Project.create( self.data(create: true) )
            json_response(code: 201, data: project)
        rescue => e
            json_response(code: 422, data: { error: e.message })
        end
    end

    # @method: Display all proojects
    get '/project' do
        projects = Project.all
        projects.to_json
    end

    # @view: Renders an erb file which shows all PROJECTS
    # erb has content_type because we want to override the default set above
    get '/' do
        @projects = Project.all.map { |student|
          {
            project: project,
            badge: student_status_badge(student.status)
          }
        }
        @i = 1
        erb_response :projects
    end

    # @method: Update existing PROJECT according to :id
    put '/project/update/:id' do
        begin
            project = Project.find(self.project_id)
            project.update(self.data)
            json_response(data: { message: "project updated successfully" })
        rescue => e
            json_response(code: 422 ,data: { error: e.message })
        end
    end

    # @method: Delete PROJECT based on :id
    delete '/project/destroy/:id' do
        begin
            project = Project.find(self.project_id)
            project.destroy
            json_response(data: { message: "project deleted successfully" })
        rescue => e
          json_response(code: 422, data: { error: e.message })
        end
    end


    private

    # @helper: format body data
    def data(create: false)
        payload = JSON.parse(request.body.read)
        if create
            payload["createdAt"] = Time.now
        end
        payload
    end

    # @helper: retrieve to-do :id
    def project_id
        params['id'].to_i
    end

    # @helper: format status style
    def project_status_badge(status)
        case status
            when 'CREATED'
                'bg-info'
            when 'ONGOING'
                'bg-success'
            when 'CANCELLED'
                'bg-primary'
            when 'COMPLETED'
                'bg-warning'
            else
                'bg-dark'
        end
    end


end