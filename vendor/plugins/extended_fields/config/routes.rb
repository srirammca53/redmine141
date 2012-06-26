ActionController::Routing::Routes.draw do |map|
    map.project_destroy_confirm('projects/:id/destroy', :controller => 'projects', :action => 'destroy', :conditions => { :method => :get })
end
