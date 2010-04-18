# == Schema Information
#
# Table name: cars
#
#  id          :integer(4)      not null, primary key
#  brand       :string(255)
#  model       :string(255)
#  diesel      :boolean(1)      default(FALSE)
#  consumption :decimal(10, 2)
#  emission    :integer(4)      default(0)
#  rating      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#
class Car < ActiveRecord::Base

  include DataFetcher

  @@oil_prices ||= OilFetcher.new.average_prices

  cattr_accessor :oil_prices

  validates_uniqueness_of :finish, :scope => [:brand, :model]
  before_save :calculate_consume_range

  named_scope :seats_range_is, lambda { |range|
    if range == '1'
      {:conditions => ['seats <= ?', 5]}
    elsif range == '2'
      {:conditions => ['seats > ? AND seats >= ?',6 ,7]}
    elsif range == '3'
      {:conditions => ["seats > ?", 7]}
    else
      {}
    end
  }

  named_scope :best_cars, :order => 'cars.rating asc, cars.emissions asc', :limit => 25
  named_scope :best, :order => 'cars.rating asc, cars.emissions asc', :limit => 5

  data_fetcher :uri => CARS_URI
  
  define_index do
    indexes brand
    indexes model
    indexes finish
    indexes fuel
    indexes market_segment
    indexes engine
    indexes cylinders
    indexes wheel_drive
    indexes gear
  end
  
  #<5 - 5,6 - 6,7 - 7,9 > 9
  LESS_THAN_5     = 1
  BETWEEN_5_AND_6 = 2
  BETWEEN_6_AND_7 = 3
  BETWEEN_7_AND_9 = 4
  GREATER_THAN_9  = 5
  
  
  def to_param
    "#{id}-#{brand.to_s.parameterize}-#{model.to_s.parameterize}"
  end

  def full_model
    "#{brand} #{model} #{finish}"
  end

  def self.fetch
    agent = Mechanize.new
    page = agent.get(uri_data_fetcher)
    form = page.form('aspnetForm')

    #brand list
    form.field_with(:name => 'ctl00$ContenidoPagina$ddlMarca').options.each do |brand|
      unless brand.text == 'Cualquiera'
        form.field_with(:name => 'ctl00$ContenidoPagina$ddlMarca').option_with(:text => brand.text).click
        form.submit #we make click on select

        form = agent.page.form('aspnetForm') #reload form
        form.field_with(:name => 'ctl00$ContenidoPagina$ddlModelo').options.each do |model| #models list
          unless model.text == 'Cualquiera'
#            puts "#{brand.text} #{model.text}"
            form.field_with(:name => 'ctl00$ContenidoPagina$ddlModelo').option_with(:text => model.text).click
            form.radiobuttons_with(:name => 'ctl00$ContenidoPagina$Paginar')[1].check
            doc = form.submit
            # puts doc.search("//tr[@class='color1' or @class='color2']")[0].search("td")[1].content
            # error!
            doc.search("//tr[@class='color1' or @class='color2']").each do |row|
              columns = row.search("td")
              link = columns.search('a')[0]
              agent2 = Mechanize.new
              page = agent.get(link[:href])
              car = Car.new
              car.brand = brand.text
              car.model = model.text
              
              car.finish = link.content.split("#{brand.text} #{model.text}").last.strip
              car.fuel = page.search('//*[@id="lblMotorizacion"]')[0].content == 'Gasolina' ? 'Gasolina' : 'Gasóleo'
              car.consume = columns[1].content.gsub(',', '.')
              car.emissions = columns[2].content
              car.rating = page.search('//*[@id="imgClasificacion"]')[0][:src][22] - ?A + 1
              car.market_segment = page.search("//*[@id='lblSegmentoComercial']")[0].content
              car.engine = page.search('//*[@id="lblCilindrada"]')[0].content
              car.cylinders = page.search('//*[@id="lblNumCilindros"]')[0].content
              car.wheel_drive = page.search('//*[@id="lblTraccion"]')[0].content

              car.gear = case page.search('//*[@id="lblTipoCambio"]')[0].content
                          when 'M': 'Manual'
                          when 'A': 'Automático'
                          else 'Otros'
                         end
              car.minimal_tare = page.search('//*[@id="lblTaraNominalMinima"]')[0].content
              car.power = page.search('//*[@id="lblPotencia"]')[0].content.split(/(0-9+),(0-9+)/)[0].gsub(',','.').split(/\([0-9]+\)/)[0].strip
              car.torque = page.search('//*[@id="lblParMaximo"]')[0].content
              car.length, car.width, car.height = page.search('//*[@id="lblDimensiones"]')[0].content.split(' x ')
              car.seats = page.search('//*[@id="lblNumPlazas"]')[0].content

              car.save
            end
          end
        end
      end
    end

  end
  
  def self.order_for_comparation(ids)
    find(ids).sort_by{|car| car.consume}
  end

  def estimate(annual_mileage)
    oil_price = (fuel == 'Gasolina' ? @@oil_prices[OilFetcher::SUPER_95] : @@oil_prices[OilFetcher::GASOLEO_A])
    return (annual_mileage * oil_price.to_f)
  end

  def self.oil_prices
    Rails.cache.fetch("car_oil_prices", 1.day) do
      OilFetcher.new.average_prices
    end
  end
  
  private

  def calculate_consume_range
    range = LESS_THAN_5 if (0..5).include? consume
    range = BETWEEN_5_AND_6 if (5..6).include? consume
    range = BETWEEN_6_AND_7 if (6..7).include? consume
    range = BETWEEN_7_AND_9 if (7..9).include? consume
    range = GREATER_THAN_9 if consume > 9 
    
    write_attribute(:consume_range, range)
  end

end

