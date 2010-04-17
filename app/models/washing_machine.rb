# == Schema Information
#
# Table name: washing_machines
#
#  id                 :integer(4)      not null, primary key
#  producer           :string(255)
#  product            :string(255)
#  brand              :string(255)
#  model              :string(255)
#  rpm                :integer(4)
#  efficiency         :string(255)
#  consume            :integer(4)
#  washing_efficiency :string(255)
#  spin_efficiency    :string(255)
#  capacity           :integer(4)
#  consume_kg         :integer(4)
#  consume_water      :integer(4)
#  height             :integer(4)
#  width              :integer(4)
#  deep               :integer(4)
#  termoefficiency    :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#
class WashingMachine < ActiveRecord::Base

  include DataFetcher
  data_fetcher :uri => 'http://www.idae.es/index.php/mod.buscador/mem.fbusquedaLavadoras/relmenu.87',
               :form => 'form_buscar_elect',
               :selector => 'div#dts-lst.con table.tbl-f3 tbody tr'

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
     :efic_centrif => 'spin_efficiency',
     :capac => 'capacity',
     :cons_kwkg => 'consume_kg',
     :cons_agua => 'consume_water',
     :alto => 'height',
     :ancho => 'width',
     :fondo => 'deep',
     :termoeficiente => 'termoefficiency'}
  end
end
