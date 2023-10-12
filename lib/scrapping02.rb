
require 'nokogiri'
require 'open-uri'
require 'rubygems'

def scrap_function
    # Récupérer la page web et la parser avec Nokogiri
    page = Nokogiri::HTML(URI.open('https://annuaire-des-mairies.com/val-d-oise.html'))
    mails = []

    links = page.xpath('//*[@class="lientxt"]')
    links.each do |link|
        link = link['href'][1..-1]
        new_link = 'https://annuaire-des-mairies.com'.concat(link)
        page = Nokogiri::HTML(URI.open(new_link))
        mail_elems = page.xpath('//*[@class="txt-primary tr-last"]/td')
        puts(mail_elems[7])
    end



end

scrap_function