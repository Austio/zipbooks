require 'singleton'

module Zipbooks
  class Store
    include ::Singleton

    attr_reader :config
    def initialize
      @config = ::Hashie::Mash.new
    end
  end
end