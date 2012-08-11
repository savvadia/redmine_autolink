class AutolinkController < ApplicationController
  unloadable
  layout 'base'
  helper :sort
  include SortHelper

  # before_filter :authorize

  def index
		sort_init "id", 'desc'
		sort_update ["id", "pattern", "list_replacement", "title_replacement"] 
		@autolinks = Autolink.find(:all)
  end

  def show
		@autolinks = Autolink.find(params[:id])
  end

  def new
    # create empty instance
    @autolink = Autolink.new()
    puts "new================> params:   " + params.inspect
    puts "================> autolink: " + @autolink.inspect()
    if request.post?
      # Case post, set attributes passed as parameters.
      @autolink.pattern = params[:autolink]["pattern"]
      @autolink.link_replacement  = params[:autolink]["link_replacement"]
      @autolink.title_replacement = params[:autolink]["title_replacement"]
      if @autolink.save
        flash[:notice] = l(:notice_successful_create)
        redirect_to :action => "index"
      end
      # In case failed to save, redirect to show.
    end
  end

  def edit
    puts "edit================> params:   " + params.inspect
	@autolink = Autolink.find(params[:id])
    if request.post?
      @autolink.pattern = params[:autolink]["pattern"]
      @autolink.link_replacement  = params[:autolink]["link_replacement"]
      @autolink.title_replacement = params[:autolink]["title_replacement"]
      if @autolink.save
        flash[:notice] = l(:notice_successful_update)
        redirect_to :action => "index", :id => @autolink.id
      end
    end
  end

  def destroy
    puts "destroy================> params:   " + params.inspect
	@autolink = Autolink.find(params[:id])
    if request.post?
      if @autolink.destroy
        flash[:notice] = l(:notice_successful_delete)
        redirect_to :action => "index"
      end
    end
  end


  def try
  end



end
