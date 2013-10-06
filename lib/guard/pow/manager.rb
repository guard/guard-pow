require 'fileutils'

module Guard
  class Pow
    class Manager

      def restart
        _touch_tmp_restart
        _notify "Pow restarted."
      end

      private

      def _touch_tmp_restart
        FileUtils.mkdir('tmp') unless File.directory?("tmp")
        FileUtils.touch('tmp/restart.txt')
      end

      def _notify(message)
        UI.info(message)
        Notifier.notify(message, title: "Pow", image: :success)
      end

    end
  end
end
