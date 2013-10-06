require 'spec_helper'
require 'fileutils'

describe Guard::Pow::Manager do
  let(:manager) { Guard::Pow::Manager.new }

  before {
    Guard::UI.stub(:info)
    Guard::Notifier.stub(:notify)
  }

  describe "#restart_pow" do

    context "without tmp dir" do
      before { FileUtils.rm_rf('tmp') }

      it "creates tmp/restart.txt" do
        expect { manager.restart }.to change { File.file?("tmp/restart.txt") }.from(false).to(true)
      end
    end

    context "with tmp dir" do
      before {
        FileUtils.mkdir 'tmp' unless File.directory?("tmp")
        FileUtils.rm_rf('tmp/restart.txt')
      }

      it "creates tmp/restart.txt" do
        expect { manager.restart }.to change { File.file?("tmp/restart.txt") }.from(false).to(true)
      end
    end

    context "with tmp dir" do
      before {
        FileUtils.mkdir 'tmp' unless File.directory?("tmp")
        FileUtils.touch('tmp/restart.txt')
        sleep 1
      }

      it "touches tmp/restart.txt" do
        expect { manager.restart }.to change { File.mtime("tmp/restart.txt") }
      end
    end
  end

end
