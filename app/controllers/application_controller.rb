class ApplicationController < Sinatra::Base
   set :views, proc { File.join(root, '../views/') }
   register Sinatra::Twitter::Bootstrap::Assets
   # set :session_secret, 'my_application_secret'

   get '/' do
      erb :index
   end
end
