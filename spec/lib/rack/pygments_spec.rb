require 'spec_helper'
require 'nokogiri'

class App
  def initialize(env={})
    @env = env
  end

  def call(env={})
    [@env[:status], @env[:headers], @env[:response]]
  end
end

shared_examples_for "a pass-through" do
  it "passes the status, headers, and response through unchanged" do
    pygments.call({}).should == [status, headers, response]
  end
end

describe Rack::Pygments do
  describe "#call" do
    let(:app) do
      App.new(:status   => status,
              :headers  => headers,
              :response => response)
    end
    let(:status)   { 200 }
    let(:headers)  { {'Content-Length' => 0, 'Content-Type' => 'text/html'} }
    let(:response) { [] }
    let(:pygments) { Rack::Pygments.new(app)}
    context "when the response content is HTML" do
      context "and the response status is 200" do
        context "and there is no highlight element in the HTML" do
          let(:response) do
            doc = <<-DOC
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html>
<head><title>Page</title></head>
<body><h1>Header</h1></body>
</html>
            DOC
            [doc]
          end
          it_should_behave_like "a pass-through"
        end
        context "and there is a highlight element in the HTML" do
          let(:response) do
            doc = <<-DOC
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html>
<head><title>Page</title></head>
<body><h1>Header</h1><highlight lang="ruby">@var='foo'</highlight></body>
</html>
            DOC
            [doc]
          end
          it "replaces the highlight element with a div containing marked-up code" do
            response = pygments.call({})[2]
            document = Nokogiri::HTML(response.join)
            document.css('highlight').should be_empty
            document.css('div.highlight').should have(1).element
          end
        end
      end
      context "and the response status is not 200" do
        let(:status) { 304 }
        it_should_behave_like "a pass-through"
      end
    end
    context "when the response content is not HTML" do
      before { headers['Content-Type'] = 'text/css' }
      it_should_behave_like "a pass-through"
    end
  end
end
