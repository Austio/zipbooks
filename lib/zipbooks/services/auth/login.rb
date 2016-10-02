module Zipbooks
  module Services
    module Auth
      class Login < Zipbooks::Services::Base
        attr_reader :email, :password

        def initialize(email: ::Zipbooks::Config::EMAIL, password: ::Zipbooks::Config::PASSWORD)
          @email = email
          @password = password
        end

        def call
          response = post_json
          if is_success_proc.call(response)
            json_parse.call(response.body).fetch('token') { 'No token on response'}
          end
        end

        def post_json
          post(json)
        end

        def json
          {
            'email' => email,
            'password' => password,
          }
        end

        def uri_path
          'auth/login'
        end
      end
    end
  end
end
