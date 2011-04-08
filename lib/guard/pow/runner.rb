require 'fileutils'

module Guard
  class Pow
    class Runner

      def restart_pow
        FileUtils.mkdir 'tmp' unless File.directory?("tmp")
        FileUtils.touch 'tmp/restart.txt'
        UI.info "Pow restarted."
        Notifier.notify("Pow restarted.", :title => "Pow", :image => :success)
      end

    end
  end
end
