ActionController::Routing::Routes.draw do |map|

  map.connect 'wktime/index', :controller => 'wktime', :action => 'index',
              :conditions => {:method => [:get]}

  map.connect 'wktime/getissues', :controller => 'wktime', :action => 'getissues',
              :conditions => {:method => [:get]}	

  map.connect 'wktime/getactivities', :controller => 'wktime', :action => 'getactivities',
              :conditions => {:method => [:get]}		

  map.connect 'wktime/deleterow', :controller => 'wktime', :action => 'deleterow',
              :conditions => {:method => [:get]}				  
			  
  map.connect 'wktime/edit', :controller => 'wktime', :action => 'edit',
              :conditions => {:method => [:get, :post]}
			  
  map.connect 'wktime/new', :controller => 'wktime', :action => 'new',
              :conditions => {:method => [:get]}			  
			  
  map.connect 'wktime/update', :controller => 'wktime', :action => 'update',
              :conditions => {:method => [:post]}
			  
  map.connect 'wktime/destroy', :controller => 'wktime', :action => 'destroy',
              :conditions => {:method => [:delete]}			  

end