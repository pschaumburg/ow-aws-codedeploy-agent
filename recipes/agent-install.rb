remote_file "#{Chef::Config[:file_cache_path]}/codedeploy-install.sh" do
    source "https://aws-codedeploy-eu-west-1.s3.amazonaws.com/latest/install"
    mode "0744"
    owner "root"
    group "root"
end

execute "install_codedeploy_agent" do
  command "#{Chef::Config[:file_cache_path]}/codedeploy-install.sh auto"
  user "root"
end

service "codedeploy-agent" do
  action [:enable, :start]
end
