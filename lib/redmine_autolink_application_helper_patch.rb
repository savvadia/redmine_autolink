# coding: UTF-8

require_dependency("application_helper")

module AutolinkApplicationHelperPatch
  def self.included(base)
    base.send(:include, InstanceMethod)
	puts "======================== AutolinkApplicationHelperPatch is included"
	#puts "---- ancestors="
	#puts ApplicationHelper.ancestors
    base.class_eval do
      alias_method_chain :parse_redmine_links, :add_autolink
    end
	#puts "======================== AutolinkApplicationHelperPatch ApplicationHelper.instance_methods=" +  ApplicationHelper.instance_methods.inspect
	#puts "---- ancestors="
	#puts ApplicationHelper.ancestors
	

  end

  module InstanceMethod
    # refer to application_helper.rb
    # Regular expression is the same as the one defined in parse_redmine_links.
    def parse_redmine_links_with_add_autolink(text, project, obj, attr, only_path, options)

	puts "======================== parse_redmine_links_with_add_autolink"

                    # pattern, link, title
	  patterns = [ ["(BASE-[0-9]+)", "http://jira.com/\\1", "\\1"],
	               ["(IMP-[0-9]+)",  "http://jira.com/\\1", "\\1"], 
	               ["([A-Z]{2}[0-9]{5})", "http://mhweb.com/\\1", "\\1"] ]
	  
	  patterns.each do |p|
		  pattern = Regexp.new(p[0])
		  link_pattern = p[1]
		  title_pattern = p[2]
		  	   
		  text.gsub!(pattern) do |m|
		  	
		  	path = m.gsub(pattern, link_pattern)
			title = m.gsub(pattern, title_pattern)
			link = link_to h(title), path, :class => 'document', :title => path

		    next link
		  end

	  end

      parse_redmine_links_without_add_autolink(text, project, obj, attr, only_path, options)
    end

  end
end

ApplicationHelper.send(:include, AutolinkApplicationHelperPatch)
	#puts "======================== AutolinkApplicationHelperPatch ApplicationHelper.instance_methods=" +  ApplicationHelper.instance_methods.inspect
	#puts "---- ancestors="
	#puts ApplicationHelper.ancestors

