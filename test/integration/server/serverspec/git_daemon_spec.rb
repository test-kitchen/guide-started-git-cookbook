require 'serverspec'
require 'pathname'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.os = backend(Serverspec::Commands::Base).check_os
    c.path = '/sbin:/usr/sbin'
  end
end

describe "Git Daemon" do

  it "is listening on port 9418" do
    expect(port(9418)).to be_listening
  end

  it "has a running service of git-daemon" do
    expect(service("git-daemon")).to be_running
  end

end
