require 'zipbooks/services/tasks/index'

module Zipbooks
  module Clients
    class Tasks
      def index
        ::Zipbooks::Services::Tasks::Index.new.call
      end
    end
  end
end