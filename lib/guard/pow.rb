require 'guard'
require 'guard/guard'

module Guard
  class Pow < Guard

    autoload :Runner, 'guard/pow/runner'
    attr_accessor :runner

    def initialize(watchers = [], options = {})
      super
      @options = {
        :restart_on_start  => false,
        :restart_on_reload => true
      }.update(options)
      @runner = Runner.new
    end

    def start
      runner.restart_pow if @options[:restart_on_start]
    end

    def reload
      runner.restart_pow if @options[:restart_on_reload]
    end

    def run_on_changes(paths)
      runner.restart_pow
    end

    def stop
      true
    end

  end
end