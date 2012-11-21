class PooController < ApplicationController
  
  def index
	
  end

  def reload
  	if params["folder"]	
  	  @folders = Dir.entries(  params["folder"] ).collect do |entry|
  	  	OpenStruct.new :name => entry , :path => File.join( params["folder"], entry ) 
  	  end

  	  session["folder"] = params["folder"]
  	end 

  	render :index

  end

  def pull
  	path = params["path"]
  	@message = %x[cd #{path} && git pull origin master]
  	render :index
  end
end
