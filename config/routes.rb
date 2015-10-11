# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'finder', :to => 'finder#index'
post 'finder/:id', :to => 'finder#delete', :as => 'remove_attachments'
