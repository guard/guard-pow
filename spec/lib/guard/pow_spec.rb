require 'spec_helper'

describe Guard::Pow do
  let(:options) { { } }
  let(:plugin) { Guard::Pow.new(options) }

  describe '#initialize' do
    it 'instanciates manager with option' do
      expect(Guard::Pow::Manager).to receive(:new)
      plugin
    end
  end

  describe "start" do
    it "doesn't restart pow by default" do
      expect(plugin.manager).to_not receive(:restart)
      plugin.start
    end

    context "with restart_on_start option" do
      let(:options) { { restart_on_start: true } }

      it "restarts pow" do
        expect(plugin.manager).to receive(:restart)
        plugin.start
      end
    end
  end

  describe "reload" do
    it "restarts pow by default" do
      expect(plugin.manager).to receive(:restart)
      plugin.reload
    end

    context "with restart_on_reload option set to false" do
      let(:options) { { restart_on_reload: false } }

      it "doesn't restart pow" do
        expect(plugin.manager).to_not receive(:restart)
        plugin.reload
      end
    end
  end

  describe "run_on_changes" do
    it "restarts pow" do
      expect(plugin.manager).to receive(:restart)
      plugin.run_on_changes(["xxx"])
    end
  end

end
