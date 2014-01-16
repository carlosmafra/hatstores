require 'open-uri'
class Admin::XmlController < ApplicationController
	def index

		doc = Nokogiri::XML(open("http://www.hatstore.com.br/xml/8c1d9/shoppinguol.xml"))
		@doc = doc
	end

	def read_xml
		
	end

	def method_name


		
	end

end