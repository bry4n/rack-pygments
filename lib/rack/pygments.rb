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
      return [status, headers, response] unless pygmentize?(status, headers)
      response_body = pygmentize(response.join)
      headers["Content-Length"] = response_body.length.to_s
      [status,headers,[response_body]]
    end

    def pygmentize?(status, headers)
      status == 200 && headers['Content-Type'] =~ /html/
    end

    def pygmentize(content)
      document = Nokogiri::HTML(content)
      nodes = document.css(@tag)
      nodes.each do |node|
        lang = node.attribute(@attr).nil? ? 'bash' : node.attribute(@attr).value

        file = Tempfile.new('pygments')
        file.write node.content
        file.close

        pygmentized = `#{@bin} -l #{lang} -f html #{file.path}`

        file.delete

        node.replace(Nokogiri::HTML(pygmentized).css("div.highlight").first)
      end
      document.to_s
    end
  end
end
