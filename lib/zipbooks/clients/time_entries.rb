require 'zipbooks/services/time_entries/create'

module Zipbooks
  module Clients
    class TimeEntries
      def create(options)
        ::Zipbooks::Services::TimeEntries::Create.new(options).call
      end
    end
  end
end
