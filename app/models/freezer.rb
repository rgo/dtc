# == Schema Information
#
# Table name: freezers
#
#  id         :integer(4)      not null, primary key
#  producer   :string(255)
#  product    :string(255)
#  brand      :string(255)
#  model      :string(255)
#  consume    :decimal(10, 3)
#  height     :integer(4)
#  width      :integer(4)
#  froost     :boolean(1)
#  created_at :datetime
#  updated_at :datetime
#
class Freezer < ActiveRecord::Base

  RATINGS={'A' => 33, 'A+' => '66', 'A++' => '100'}

  include DataFetcher
  data_fetcher :uri => 'http://www.idae.es/index.php/mod.buscador/mem.fbusquedaCongeladores/relmenu.87',
               :form => 'form_buscar_elect',
               :selector => 'div#dts-lst.con div.cpo table.tbl-f3 tbody tr'

  named_scope :consume_range_is, lambda { |range|
    if range == '1'
      {:conditions => ['consume <= ?', 170]}
    elsif range == '2'
      {:conditions => ['consume > ? AND consume <= ? ', 171,240]}
    elsif range == '3'
      {:conditions => ['consume > ? AND consume <= ? ', 241,310]}
    elsif range == '4'
      {:conditions => ["consume > ?", 311]}
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
     :clas_energ => ['efficiency', Proc.new { |value| RATINGS[value] }],
     :cons_kwano => 'consume',
     :alto => 'height',
     :ancho => 'width',
     :fondo => 'deep',
     :nofr => ['froost', Proc.new {|value| ['Sí', 'Si'].include?(value)  ?  true : false }]}
  end

  def self.efficiency_options
    Rails.cache.fetch('freezer_efficiency_options') do 
      all(:select => 'efficiency', :group => 'efficiency')
    end
  end

  def self.froost_options
    [
     [I18n.t('freezers.index.froost_options.no_froost'), '1'], 
     [I18n.t('freezers.index.froost_options.conventional'), '0']
    ]
  end
end

