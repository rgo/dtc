module CarsHelper
  def consume_range_options_for_car
    [
      [t('cars.index.consume_range.less', :max => 5), Car::LESS_THAN_5],
      [t('cars.index.consume_range.between', :min => 5, :max => 6), Car::BETWEEN_5_AND_6],
      [t('cars.index.consume_range.between', :min => 6, :max => 7), Car::BETWEEN_6_AND_7],
      [t('cars.index.consume_range.between', :min => 7, :max => 9), Car::BETWEEN_7_AND_9],
      [t('cars.index.consume_range.greater', :min => 9), Car::GREATER_THAN_9]
    ]
  end

  def seats_range_options_for_car
    [
      [t('cars.index.seats_range.less', :max => 5), '1'],
      [t('cars.index.seats_range.between', :min => 6, :max => 7), '2'],
      [t('cars.index.seats_range.greater', :min => 7), '3']
    ]
  end

end
