require 'open-uri'
class Admin::XmlController < ApplicationController
	def index

		doc = Nokogiri::XML(open("http://www.hatstore.com.br/xml/8c1d9/shoppinguol.xml"))
		@nao_exists = Array.new
		@exists = Array.new
		@doc = doc.xpath('//PRODUTOS/PRODUTO').each do |i|
			#i.xpath('DESCRICAO').children.text
			p = Produto.find_by_code(i.xpath('CODIGO').children.text)
			if p
				@exists << i
			else
				@nao_exists << i				
			end
		end

		p @nao_exists
	end

	def read_xml
		
	end

	def method_name


		
	end

end