# == Schema Information
#
# Table name: washer_dryers
#
#  id                 :integer(4)      not null, primary key
#  producer           :string(255)
#  product            :string(255)
#  brand              :string(255)
#  model              :string(255)
#  rpm                :integer(4)
#  efficiency         :string(255)
#  consume            :decimal(10, 3)
#  washing_consume    :decimal(10, 3)
#  washing_efficiency :string(255)
#  washing_capacity   :integer(4)
#  drying_capacity    :integer(4)
#  consume_kg         :decimal(10, 3)
#  water_consume      :integer(4)
#  height             :integer(4)
#  width              :integer(4)
#  deep               :integer(4)
#  termoefficiency    :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#
class WasherDryer < ActiveRecord::Base

  include DataFetcher
  data_fetcher :uri => 'http://www.idae.es/index.php/mod.buscador/mem.busquedaLavasecadoras/relmenu.87',
               :form => 'form_buscar_elect',
               :selector => 'div#dts-lst.con div.cpo table.tbl-f3 tbody tr'

  named_scope :consume_range_is, lambda { |range|
    if range == '1'
      {:conditions => ['consume <= ?', 5]}
    elsif range == '2'
      {:conditions => [ 'consume > ? AND consume <= ?',6 ,8 ]}
    elsif range == '3'
      {:conditions => ["consume > ?", 9]}
    else
      {}
    end
  }

  define_index do
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
     :vel_centrif => 'rpm',
     :clas_energ => ['efficiency', Proc.new { |value| value[0] - ?A + 1}],
     :cons_kwciclo => 'consume',
     :cons_lavado => 'washing_consume',
     :efic_lavado => ['washing_efficiency', Proc.new { |value| value[0] - ?A + 1}],
     :capac_lavado => 'washing_capacity',
     :capac_secado => 'drying_capacity',
     :cons_kwkg => 'consume_kg',
     :cons_agua => 'water_consume',
     :alto => 'height',
     :ancho => 'width',
     :fondo => 'deep',
     :termoeficiente => 'termoefficiency'}
  end

  def self.efficiency_options
    Rails.cache.fetch('washer_dryers_efficiency_options') do 
      all(:select => 'efficiency', :group => 'efficiency')
    end
  end

  def self.rpm_options
    Rails.cache.fetch('washer_dryers_rpm_options') do 
      all(:select => 'rpm', :group => 'rpm')
    end
  end

  def self.washing_capacity_options
    Rails.cache.fetch('washer_dryers_washing_capacity_options') do 
      all(:select => 'washing_capacity', :group => 'washing_capacity')
    end
  end
end

