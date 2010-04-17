# == Schema Information
#
# Table name: fridges
#
#  id         :integer(4)      not null, primary key
#  producer   :string(255)
#  product    :string(255)
#  brand      :string(255)
#  model      :string(255)
#  efficiency :string(255)
#  consume    :decimal(10, 3)
#  height     :integer(4)
#  width      :integer(4)
#  deep       :integer(4)
#  froost     :boolean(1)
#  created_at :datetime
#  updated_at :datetime
#
class Fridge < ActiveRecord::Base

  include DataFetcher
  data_fetcher :uri => 'http://www.idae.es/index.php/mod.buscador/mem.fbusquedaFrigorificos/relmenu.87',
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
     :clas_energ => 'efficiency',
     :cons_kwano => 'consume',
     :alto => 'height',
     :ancho => 'width',
     :fondo => 'deep',
     :nofr => ['froost', Proc.new {|value| ['Sí', 'Si'].include?(value)  ?  true : false }]}
  end
end
