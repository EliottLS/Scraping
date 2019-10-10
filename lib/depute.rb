require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
page = Nokogiri::HTML(open("https://wiki.laquadrature.net/Contactez_vos_députés"))

noms = page.xpath('//html/body/div[6]/ul[2]/li').find_all
noms_array = noms.collect(&:text)
noms_array