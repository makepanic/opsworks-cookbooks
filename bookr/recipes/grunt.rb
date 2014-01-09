node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'nodejs'
    Chef::Log.debug("Skipping deploy::nodejs application #{application} as it is not a node.js app")
    next
  end

  execute "Running grunt with node #{node[:opsworks_nodejs][:version]}" do
    cwd "#{deploy[:deploy_to]}/current/"
    command "node node_modules/grunt-cli/bin/grunt"

    only_if do
      ::File.exists?("#{deploy[:deploy_to]}/current/node_modules/grunt-cli/bin/grunt")
    end
  end
end
