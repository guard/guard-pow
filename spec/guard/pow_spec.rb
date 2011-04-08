require 'spec_helper'

describe Guard::Pow do
  subject { Guard::Pow.new }

  describe '#initialize' do
    it 'should instanciate runner with option' do
      Guard::Pow::Runner.should_receive(:new)
      Guard::Pow.new [], { :bundler => false }
    end
  end

  describe "start" do
    it "should restart pow" do
      subject.runner.should_receive(:restart_pow)
      subject.start
    end
  end

  describe "reload" do
    it "should restart pow" do
      subject.runner.should_receive(:restart_pow)
      subject.reload
    end
  end

  describe "run_on_change" do
    it "should restart pow" do
      subject.runner.should_receive(:restart_pow)
      subject.run_on_change(["xxx"])
    end
  end

  describe "stop" do
    it "should do nothing'" do
      subject.runner.should_not_receive(:restart_pow)
      subject.stop
    end
  end

end
