require 'redmine'
require_dependency 'finder_hook_listener'

Redmine::Plugin.register :redmine_finder do
  name 'Redmine Finder plugin'
  author 'Thanh, Nguyen Duy'
  description 'This is a plugin for File Management in Redmine'
  version '0.0.1'
  url 'http://invisiblezero.net'
  author_url 'http://invisiblezero.net'

  permission :view_finder, {:finder => [:index, :show]}
  
  menu :project_menu, :finder, { :controller => 'finder', :action => 'index' }, :caption => 'Attachments'
end
