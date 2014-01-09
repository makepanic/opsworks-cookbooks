node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'nodejs'
    Chef::Log.debug("Skipping deploy::nodejs application #{application} as it is not a node.js app")
    next
  end

  template "#{deploy[:deploy_to]}/current/config.json" do
    cookbook 'bookr'
    source 'bookr-web-client-config.json.erb'
    mode '0660'
    owner deploy[:user]
    group deploy[:group]
  end
end
