require 'open-uri'
class Admin::XmlController < ApplicationController
	def index

		doc = Nokogiri::XML(open("http://www.hatstore.com.br/xml/8c1d9/shoppinguol.xml"))
		@nao_exists = Array.new
		@exists = Array.new
		@doc = doc.xpath('//PRODUTOS/PRODUTO').each do |i|
			#i.xpath('DESCRICAO').children.text
			xml = Admin::Produto.find_by_code(i.xpath('CODIGO').children.text)
			if xml
				@exists << { codigo: i.xpath("CODIGO").children.text, name: i.xpath("DESCRICAO").children.text, url: i.xpath("URL").children.text, preco: i.xpath("PRECO").children.text, nparcela: i.xpath("NPARCELA").children.text, image: i.xpath("URL_IMAGE").children.text, marca: i.xpath("DEPARTAMENTO").children.text , exists: '1'}
			else
				@nao_exists << { codigo: i.xpath("CODIGO").children.text, name: i.xpath("DESCRICAO").children.text, url: i.xpath("URL").children.text, preco: i.xpath("PRECO").children.text, nparcela: i.xpath("NPARCELA").children.text, image: i.xpath("URL_IMAGE").children.text, marca: i.xpath("DEPARTAMENTO").children.text, exists: '0' }
			end
			p @nao_exists
		end

		p @nao_exists
	end

	def read_xml
		
	end

	def method_name


		
	end

end