require 'zipbooks/services/projects/index'

module Zipbooks
  module Clients
    class Projects
      def index
        ::Zipbooks::Services::Projects::Index.new.call
      end
    end
  end
end