# == Schema Information
#
# Table name: ovens
#
#  id         :integer(4)      not null, primary key
#  producer   :string(255)
#  product    :string(255)
#  brand      :string(255)
#  model      :string(255)
#  type       :string(255)
#  efficiency :string(255)
#  consume    :decimal(10, 3)
#  volume     :integer(4)
#  warming    :string(255)
#  height     :integer(4)
#  width      :integer(4)
#  deep       :integer(4)
#  created_at :datetime
#  updated_at :datetime
#
class Oven < ActiveRecord::Base


  include DataFetcher
  data_fetcher :uri => 'http://www.idae.es/index.php/mod.buscador/mem.busquedaHornos/relmenu.87',
               :form => 'form_buscar_elect',
               :selector => 'div#dts-lst.con div.cpo table.tbl-f3 tbody tr'

  define_indexes do
    indexes producer
    indexes product
    indexes brand
    indexes model
  end
  
  def to_param
    "#{id}-#{brand.to_s.parameterize}-#{model.to_s.parameterize}"
  end

  def self.fetch_mapping
    {:prodtr => 'producer',
     :prod => 'product',
     :marc => 'brand',
     :modelo => 'model',
     :tip => 'type',
     :cons_kwhora => 'consume',
     :vol_neto => 'volume',
     :calent => 'warming',
     :alto => 'height',
     :ancho => 'width',
     :fondo => 'deep',
     :termoeficiente => 'termoefficiency'}
  end
end
