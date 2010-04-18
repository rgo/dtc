require 'mechanize'

class OilFetcher < Mechanize

  def initialize
    super
    get('http://www.gasofa.es')
  end

  def average_prices
    return @average_prices if @average_prices
    @average_prices = []
    page.search("//p[@class='tabla'][not(@id)]/span").each do |span|
      @average_prices << span.text[/(\d,\d{1,2})/]
    end
    @average_prices.compact!
  end

  def oil_names
    return @oil_names if @oil_names
    @oil_names = []
    # TODO deal with encoding    
#    page.search("//p[@class='tabla'][@id]/span").each do |span|
#      @oil_names << span.text[/[\w\s]+/]
#    end
#    @oil_names.compact!

    @oil_names = ["Super 95", "Super 98", "Gasóleo A", "Gasóleo A Nuevo"]
  end

  def oil_options
    @oil_options = []
    4.times do |i|
      @oil_options << [oil_names[i], average_prices[i]]
    end
    @oil_options
  end

end