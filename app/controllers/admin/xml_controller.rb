require 'open-uri'
class Admin::XmlController < ApplicationController
	def index
		@xml = Admin::Produto.new

		@array_produtos = Array.new
		produtos = Admin::Produto.all
		doc = Nokogiri::XML(open("http://www.hatstore.com.br/xml/8c1d9/shoppinguol.xml"))
		@doc = doc.xpath('//PRODUTOS/PRODUTO').each do |i|
			#i.xpath('DESCRICAO').children.text
			xml = Admin::Produto.find_by_code(i.xpath('CODIGO').children.text)
				if xml
					@array_produtos << { codigo: i.xpath("CODIGO").children.text, name: i.xpath("DESCRICAO").children.text, url: i.xpath("URL").children.text, preco: i.xpath("PRECO").children.text, nparcela: i.xpath("NParcela").children.text, vparcela: i.xpath("VParcela").children.text, image: i.xpath("URL_IMAGE").children.text, marca: i.xpath("DEPARTAMENTO").children.text , exists: '1'}
				else
					@array_produtos << { codigo: i.xpath("CODIGO").children.text, name: i.xpath("DESCRICAO").children.text, url: i.xpath("URL").children.text, preco: i.xpath("PRECO").children.text, nparcela: i.xpath("NParcela").children.text, vparcela: i.xpath("VParcela").children.text, image: i.xpath("URL_IMAGE").children.text, marca: i.xpath("DEPARTAMENTO").children.text, exists: '0' }
					
				end				
		end
	end

	def read_xml
		
	end
end