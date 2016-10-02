module Zipbooks
  module Services
    module TimeEntries
      class Create < Zipbooks::Services::Base

        attr_reader :date, :note, :duration, :task_id

        # duration in seconds
        # date in YY-MM-DD
        def initialize(options)
          options = options

          @task_id  = options.fetch(:task_id) { raise 'Creating a time entry requires a task_id'}
          @duration = options.fetch(:duration) { raise 'Creating a time entry requires a duration in seconds'}
          @date = options[:date]
          @note = options[:note]
        end

        def call
          is_success_proc.call(post_json)
        end

        def uri_path
          'time_entries'
        end

        def json
          required_json.merge(optional_date).merge(optional_note)
        end

        def required_json
          {
            task_id: task_id,
            duration: duration
          }
        end

        def optional_date
          return {} if date.nil?

          { date: date }
        end

        def optional_note
          return {} if note.nil?

          { note: note }
        end

      end
    end
  end
end
