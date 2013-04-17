require 'spec_helper'
require 'fileutils'

describe Guard::Pow::Runner do
  subject { Guard::Pow::Runner.new }

  describe "#restart_pow" do

    context "without tmp dir" do
      before(:each) { FileUtils.rm_rf('tmp') }

      it "should create tmp/restart.txt" do
        expect { subject.restart_pow }.to change { File.file?("tmp/restart.txt") }.from(false).to(true)
      end
    end

    context "with tmp dir" do
      before(:each) do
        FileUtils.mkdir 'tmp' unless File.directory?("tmp")
        FileUtils.rm_rf('tmp/restart.txt')
      end

      it "should create tmp/restart.txt" do
        expect { subject.restart_pow }.to change { File.file?("tmp/restart.txt") }.from(false).to(true)
      end
    end

    context "with tmp dir" do
      before(:each) do
        FileUtils.mkdir 'tmp' unless File.directory?("tmp")
        FileUtils.touch('tmp/restart.txt')
        sleep 1
      end

      it "should touch tmp/restart.txt" do
        expect { subject.restart_pow }.to change { File.mtime("tmp/restart.txt") }
      end
    end
  end

end
