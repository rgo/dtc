# == Schema Information
#
# Table name: air_conditionings
#
#  id                      :integer(4)      not null, primary key
#  brand                   :string(255)
#  indoor_units            :integer(4)
#  indoor_unit1            :string(255)
#  indoor_unit2            :string(255)
#  outdoor_unit            :string(255)
#  description             :string(255)
#  air_condensation_type   :string(255)
#  water_condensation_type :string(255)
#  cooling_capacity        :decimal(10, 3)
#  power_cooling           :decimal(10, 3)
#  efficiency_cooling      :decimal(10, 3)
#  rating_cooling          :integer(4)
#  heating_capacity        :decimal(10, 3)
#  power_heating           :decimal(10, 3)
#  efficiency_heating      :decimal(10, 3)
#  rating_heating          :integer(4)
#  eurovent                :boolean(1)
#  created_at              :datetime
#  updated_at              :datetime
#
class AirConditioning < ActiveRecord::Base
  include DataFetcher
  data_fetcher :uri => 'http://www.idae.es/index.php/mod.buscador/mem.fbusquedaAires/relmenu.159',
               :form => 'form_buscar_elect',
               :selector => 'div#dts-lst.con div.cpo table.tbl-f3 tbody tr'

  define_indexes do
    indexes brand
    indexes indoor_unit1
    indexes indoor_unit2
    indexes outdoor_unit
    indexes description
  end

  def self.fetch_mapping
    {:marc => [ 'brand', Proc.new {|value| value.delete("\n")} ],
     :numudint => 'indoor_units',
     :udint1 => 'indoor_unit1',
     :udint2 => 'indoor_unit2',
     :udext => 'outdoor_unit',
     :descripcion => 'description',
     :condaire => 'air_condensation_type',
     :condagua => 'water_condensation_type',
     :cap_frio => 'cooling_capacity',
     :pot_frio => 'power_cooling',
     :coef_frio => 'efficiency_cooling',
     :clas_frio => 'rating_cooling',
     :cap_calor => 'heating_capacity',
     :pot_calor => 'power_heating',
     :coef_calor => 'efficiency_heating',
     :clas_calor => 'rating_heating',
     :'colEer' => ['eurovent', Proc.new {|value| ['Sí', 'Si'].include?(value)  ?  true : false }]}
  end
end

