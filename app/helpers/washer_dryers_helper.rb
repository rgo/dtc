module WasherDryersHelper
  def consume_range_options_for_washer_dryer
    [
      [t('freezers.index.consume_range.less', :max => 5), '1'],
      [t('freezers.index.consume_range.between', :min => 6, :max => 8), '2'],
      [t('freezers.index.consume_range.greater', :min => 9), '3']
    ]
  end
end
