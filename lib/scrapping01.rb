
require 'nokogiri'
require 'open-uri'
require 'rubygems'

def scrap_function
  # Récupérer la page web et la parser avec Nokogiri
  page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))

  # XPath pour les noms des crypto-monnaies
  crypto_names = page.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--hide-sm cmc-table__cell--sort-by__symbol"]')

  # XPath pour les valeurs des crypto-monnaies
  crypto_values = page.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]')

  # Créer un tableau de hachages
  cryptocurrencies = []
  crypto_names.zip(crypto_values) do |name, value|
    cryptocurrencies << { name.text => value.text }
  end
  # Afficher le tableau de crypto-monnaies

  # if array contains data then return true 
  if cryptocurrencies.length
    return true
  end
  # otherwise return false
  return false

end

scrap_function