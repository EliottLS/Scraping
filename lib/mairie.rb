require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/ableiges.html")) 

mairie = page.xpath('//html/body/tbody/tr/td[2]/table/tbody/tr[@href]').find_all

p mairie

