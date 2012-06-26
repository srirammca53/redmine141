require 'redmine'

Redmine::Plugin.register :redmine_wktime do
  name 'Weekly Timesheet'
  author 'Dhanasingh Krishnapandian'
  description 'This is a plugin for entering weekly timesheet'
  version '0.0.8'
  url 'http://www.redmine.org/plugins/wk-time'
  author_url 'http://www.adhisoftware.co.in/about'
  menu :top_menu, :wkTime, { :controller => 'wktime', :action => 'index' }, :caption => :label_wktime, :if => Proc.new { User.current.logged? }
end
