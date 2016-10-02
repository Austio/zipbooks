module Zipbooks
  module Services
    module Projects
      class Index < Zipbooks::Services::Base

        def call
          response = get

          json_parse.call(response)
        end

        def uri_path
          'projects'
        end
      end
    end
  end
end
