require 'guard'
require 'guard/guard'

module Guard
  class Pow < Guard

    autoload :Runner, 'guard/pow/runner'
    attr_accessor :runner

    def initialize(watchers = [], options = {})
      super
      @runner = Runner.new
    end

    def start
      runner.restart_pow
    end

    def reload
      runner.restart_pow
    end

    def run_on_change(paths)
      runner.restart_pow
    end

    def stop
      true
    end

  end
end