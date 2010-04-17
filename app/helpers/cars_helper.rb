module CarsHelper
  def consume_range_options_for_car
    [
      [t('general.range.less', :max => 5), Car::LESS_THAN_5],
      [t('general.range.between', :min => 5, :max => 6), Car::BETWEEN_5_AND_6],
      [t('general.range.between', :min => 6, :max => 7), Car::BETWEEN_6_AND_7],
      [t('general.range.between', :min => 7, :max => 9), Car::BETWEEN_7_AND_9],
      [t('general.range.greater', :min => 9), Car::GREATER_THAN_9]
    ]
  end

end
