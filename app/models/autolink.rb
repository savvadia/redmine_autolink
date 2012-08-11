class Autolink < ActiveRecord::Base
	unloadable

	def try
	  	flash[:notice] = "try() was called" 
	end

end

