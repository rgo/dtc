module FridgesHelper
  def consume_range_options_for_fridge
    [
      [t('freezers.index.consume_range.less', :max => 200), '1'],
      [t('freezers.index.consume_range.between', :min => 201, :max => 350), '2'],
      [t('freezers.index.consume_range.between', :min => 351, :max => 500), '3'],
      [t('freezers.index.consume_range.greater', :min => 501), '4']
    ]
  end
end
