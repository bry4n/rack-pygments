require "nokogiri"

module Rack
  class Pygments

    def initialize(app, opts={})
      @app = app
      @tag = opts[:html_tag].nil? ? 'highlight' : opts[:html_tag] 
      @attr = opts[:html_attr].nil? ? 'lang' : opts[:html_attr]
      if system("which pygmentize > /dev/null")
        @bin = `which pygmentize`.chomp
      else
        raise Exception, "Pygmentize is missing"
      end
    end
    
    def call(env)
      status, headers, response = @app.call(env)
      content = response.instance_variable_get("@body").to_s
      document = Nokogiri::HTML(content)
      nodes = document.css(@tag)
      nodes.each do |node|
        lang = node.attribute(@attr).nil? ? 'bash' : node.attribute(@attr).value
        pygmentize = `echo '#{node.content}' | #{@bin} -l #{lang} -f html`
        node.replace(Nokogiri::HTML(pygmentize).css("div.highlight").first)
      end
      response = document.to_s
      headers["Content-Length"] = response.length.to_s
      [status,headers,[response]]
    end

  end
end
