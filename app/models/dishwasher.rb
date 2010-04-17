# == Schema Information
#
# Table name: dishwashers
#
#  id                 :integer(4)      not null, primary key
#  producer           :string(255)
#  product            :string(255)
#  brand              :string(255)
#  model              :string(255)
#  efficiency         :string(255)
#  consume            :decimal(10, 3)
#  washing_efficiency :string(255)
#  drying_efficiency  :string(255)
#  cutlery            :integer(4)
#  water_consume      :integer(4)
#  height             :integer(4)
#  width              :integer(4)
#  deep               :integer(4)
#  termoefficiency    :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#
class Dishwasher < ActiveRecord::Base

  include DataFetcher
  data_fetcher :uri => 'http://www.idae.es/index.php/mod.buscador/mem.busquedaLavavajillas/relmenu.87',
               :form => 'form_buscar_elect',
               :selector => 'div#dts-lst.con div.cpo table.tbl-f3 tbody tr'

  define_indexes do
    indexes producer
    indexes product
    indexes brand
    indexes model
  end

  def self.fetch_mapping
    {:prodtr => 'producer',
     :prod => 'product',
     :marc => 'brand',
     :modelo => 'model',
     :vel_centrif => 'rpm',
     :clas_energ => 'efficiency',
     :cons_kwciclo => 'consume',
     :efic_lavado => 'washing_efficiency',
     :efic_secado => 'drying_efficiency',
     :cubiertos => 'cutlery',
     :cons_agua => 'water_consume',
     :alto => 'height',
     :ancho => 'width',
     :fondo => 'deep',
     :termoeficiente => 'termoefficiency'}
  end
end
