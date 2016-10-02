module Zipbooks
  module Services
    module Tasks
      class Index < Zipbooks::Services::Base

        def call
          response = get

          json_parse.call(response)
        end

        def uri_path
          'tasks'
        end

      end
    end
  end
end
