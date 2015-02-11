require "api_auth"
require "httparty"


class User
	attr_accessor :name, :password
	
	def initialize_user (name, password)
		@name = name
		@password = password
	end
end

class Mingle_Daemon
  attr_accessor :http_client, :mingle_server, :project‰
  def initialize(user, project_name)
    @http_client =httparty
    @mingle_server = 'careerbuilder.mingle-api.thoughtworks.com'
    @mingle_api_version = '/api/v2/projects'
    @project_name = project_name
    @auth = {:basic_auth => {:username => user.name, :password => user.password } }
  end
end
username = 'dave.bennett@careerbuilder.com'
password = 'derp'
hmac_password = '/yXQBIgN2iDCJL4kxe1XLMfX6RZtP7smd96alrcKdyo='


protocol = 'https://'
base = 'careerbuilder.mingle-api.thoughtworks.com'
api_version = '/api/v2/projects'
project_name = '/workforce_analytics_kanban_'
mql_call = '/cards/execute_mql.json'
mql_params = '?mql='
api_url = protocol + base + api_version + project_name + mql_call

user = User.new(username,password)
worker = Mingle_Daemon.new(user, project_name)
@http_client.get(api_url,@auth)


