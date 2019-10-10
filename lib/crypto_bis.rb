require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
puts page.class   # => Nokogiri::HTML::Document



    noms = page.xpath('//tr/td[@class="text-left col-symbol"]').find_all
noms_array = noms.collect(&:text)
noms_array





cours = page.xpath('//tr/td[@class="no-wrap text-right"]/a').find_all
cours_array = cours.collect(&:text)
cours_array.map! do |x|
x.delete("$").to_f
end 



final_hash = Hash[noms_array.zip(cours_array)]



Hash.class_eval do
   def split_into(divisions)
     count = 0
     inject([]) do |final, key_value|
       final[count%divisions] ||= {}
       final[count%divisions].merge!({key_value[0] => key_value[1]})
       count += 1
       final
     end
   end
 end

p final_hash.split_into(noms_array.size)




    



