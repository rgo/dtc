# == Schema Information
#
# Table name: worktop_inductions
#
#  id                     :integer(4)      not null, primary key
#  producer               :string(255)
#  product                :string(255)
#  brand                  :string(255)
#  model                  :string(255)
#  type                   :string(255)
#  total_torchs           :integer(4)
#  inductio_torchs        :integer(4)
#  width_ext              :integer(4)
#  deep_ext               :integer(4)
#  width_ins              :integer(4)
#  deep_ins               :integer(4)
#  power_torchs           :integer(4)
#  power_induction_torchs :integer(4)
#  created_at             :datetime
#  updated_at             :datetime
#
class WorktopInduction < ActiveRecord::Base

  include DataFetcher
  data_fetcher :uri => 'http://www.idae.es/index.php/mod.buscador/mem.fbusquedaEncimerasInduccion/relmenu.87',
               :form => 'form_buscar_elect',
               :selector => 'div#dts-lst.con table.tbl-f3 tbody tr'

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
     :model => 'model',
     :tip => 'type',
     :numfoct => 'total_torchs',
     :numfoci => 'inductio_torchs',
     :anche => 'width_ext',
     :fonde => 'deep_ext',
     :anchi => 'width_ins',
     :fondi => 'deep_ins',
     :potencr => 'power_torchs',
     :potenci => 'power_induction_torchs'}
  end
end

