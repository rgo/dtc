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

  validates_uniqueness_of :finish, :scope => [:brand, :model]

  data_fetcher :uri => CARS_URI
  
  define_index do
    indexes brand
    indexes model
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
              car.fuel = page.search('//*[@id="lblMotorizacion"]')[0].content
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

end

