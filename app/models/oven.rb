# == Schema Information
#
# Table name: ovens
#
#  id         :integer(4)      not null, primary key
#  producer   :string(255)
#  product    :string(255)
#  brand      :string(255)
#  model      :string(255)
#  kind       :string(255)
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


  named_scope :consume_range_is, lambda { |range|
    if range == '1'
      {:conditions => ['consume <= ?', 1]}
    elsif range == '2'
      {:conditions => ['consume > ? AND consume <= ?', 2, 3]}
    elsif range == '3'
      {:conditions => ['consume > ? AND consume <= ?', 3, 4]}
    elsif range == '4'
      {:conditions => ["consume > ?", 3]}
    else
      {}
    end
  }

  named_scope :volume_range_is, lambda { |range|
    if range == '1'
      {:conditions => ['volume <= 30', 1]}
    elsif range == '2'
      {:conditions => ['volume > 30 AND volume <= 40', 2, 3]}
    elsif range == '3'
      {:conditions => ['volume > 40 AND volume <= 55', 2, 3]}
    elsif range == '4'
      {:conditions => ['volume > 55 AND volume <= 70', 3, 4]}
    elsif range == '5'
      {:conditions => ["volume > ?", 70]}
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
     :tip => 'kind',
     :clas_energ => ['efficiency', Proc.new {|value| value[0] - ?A + 1 }],
     :cons_kwhora => 'consume',
     :vol_neto => 'volume',
     :calent => 'warming',
     :alto => 'height',
     :ancho => 'width',
     :fondo => 'deep',
     :termoeficiente => 'termoefficiency'}
  end

  def self.warming_options
    Rails.cache.fetch('oven_warming_options') do
      all(:select => 'warming', :group => 'warming')
    end
  end

  def self.order_for_comparation(ids)
    find(ids).sort_by{|o| o.consume}
  end

end
