require 'open-uri'
class Admin::XmlController < ApplicationController
	def index
		@array_produtos = Array.new
		produtos = Admin::Produto.all
		doc = Nokogiri::XML(open("http://www.hatstore.com.br/xml/8c1d9/shoppinguol.xml"))
		@doc = doc.xpath('//PRODUTOS/PRODUTO').each do |i|
			#i.xpath('DESCRICAO').children.text
			#xml = Admin::Produto.find_by_code(i.xpath('CODIGO').children.text)
			produtos.each do |produto|
				if produto.code.include?(i.xpath('CODIGO').children.text)
					@array_produtos << { codigo: i.xpath("CODIGO").children.text, name: i.xpath("DESCRICAO").children.text, url: i.xpath("URL").children.text, preco: i.xpath("PRECO").children.text, nparcela: i.xpath("NPARCELA").children.text, image: i.xpath("URL_IMAGE").children.text, marca: i.xpath("DEPARTAMENTO").children.text , exists: '1'}
				else
					@array_produtos << { codigo: i.xpath("CODIGO").children.text, name: i.xpath("DESCRICAO").children.text, url: i.xpath("URL").children.text, preco: i.xpath("PRECO").children.text, nparcela: i.xpath("NPARCELA").children.text, image: i.xpath("URL_IMAGE").children.text, marca: i.xpath("DEPARTAMENTO").children.text, exists: '0' }
				end				
			end
		end
	end

	def create_or_update_produtos
	end

	def read_xml
		
	end

	def method_name


		
	end

end