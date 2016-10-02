module Zipbooks
  module Services
    class Base

      protected

      def json_parse
        Proc.new do |body|
          json_body = JSON.parse(body)

          if json_body.is_a?(Array)
            json_body.map{|b| ::Hashie::Mash.new(b)}
          else
            ::Hashie::Mash.new(json_body)
          end
        end
      end

      def is_success_proc
        Proc.new do |response|
          code = response.code
          raise 'response does not have code' unless code

          code =~ /20(0|1)/
        end
      end

      def uri_path
        raise 'must_implement'
      end

      def base_url
        Zipbooks::Config::URL
      end

      def post_json
        post(json)
      end

      def post(json)
        Net::HTTP.post_form(parsed_url, json)
      end

      def json
        raise 'must_implement'
      end

      def get
        Net::HTTP.get(parsed_url)
      end

      def parsed_url
        URI.parse(full_url)
      end

      def full_url
        url = [base_url, uri_path].join('/')
        [url, jwt_token].join('?')
      end

      def jwt_token
        "token=#{::Zipbooks::Store.instance.config.jwt}"
      end

    end
  end
end
