require 'redmine'
require "redmine_autolink_application_helper_patch"

Redmine::Plugin.register :redmine_autolink do
  name 'Redmine Autolink plugin'
  author 'Diana Savvatina'
  description 'Automatically replaces text with links according to the configured patterns.'
  version '0.0.1'
  requires_redmine :version_or_higher => '1.2.0'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
  
  menu :project_menu, :autolinks, { :controller => 'autolink', :action => 'index' }, :caption => 'Autolinks'

  project_module :autolinks do
    #permission :edit_autolinks, {:autolinks => [:new, :edit, :destroy]}
    #permission :show_autolinks, {:autolinks => [:index, :show]}
  end
#  permission :view_autolinks, :autolinks => :index
#  permission :edit_autolinks, :autolinks => :edit
end

