require 'net/http'
require 'json'
require 'hashie'

require 'zipbooks/store'
require 'zipbooks/clients/auth'
require 'zipbooks/clients/tasks'
require 'zipbooks/clients/projects'
require 'zipbooks/clients/time_entries'

module Zipbooks
  class Client

    def initialize
      set_jwt_token
    end

    def projects
      Zipbooks::Clients::Projects.new
    end

    def tasks
      Zipbooks::Clients::Tasks.new
    end

    def time_entries
      Zipbooks::Clients::TimeEntries.new
    end

    private

    def set_jwt_token
      token = ::Zipbooks::Services::Auth::Login.new.call

      ::Zipbooks::Store.instance.config.jwt = token
    end
  end
end
