require "minitest/spec"

describe_recipe "opsworks_nodejs::configure" do
  include MiniTest::Chef::Resources
  include MiniTest::Chef::Assertions

  it "install the default opsworks.js for each node app" do
    node["deploy"].each do |application, deploy|
      next unless deploy["application_type"] == "nodejs"
      config = File.join("#{deploy[:deploy_to]}", "current/config/bookr-config.json")
      file(config).must_exist.with(:mode, "0660").and(:owner, "#{deploy[:user]}").and(:group, "#{deploy[:group]}")
    end
  end
end
