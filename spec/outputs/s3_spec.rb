# encoding: utf-8
require "logstash/devutils/rspec/spec_helper"
require "logstash/outputs/s3"

describe LogStash::Outputs::S3 do
  it "should register" do
    output = LogStash::Plugin.lookup("output", "s3").new("temp_directory" => "./")

    # register will try to load jars and raise if it cannot find jars
    expect {output.register}.to_not raise_error
  end
#  describe 'AWS' do
#  end

  describe "sprintf" do

    before :each do
      @s3 = LogStash::Outputs::S3.new("temp_directory" => "./")
    end

    it "should format %Y" do
      @s3.sprintf("%{YEAR}").should eq(Time.now.year)
    end

  end
  #  it "should gzip"
end
