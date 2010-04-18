module FreezersHelper
  def consume_range_options_for_freezer
    [
      [t('freezers.index.consume_range.less', :max => 170), '1'],
      [t('freezers.index.consume_range.between', :min => 171, :max => 240), '2'],
      [t('freezers.index.consume_range.between', :min => 241, :max => 310), '3'],
      [t('freezers.index.consume_range.greater', :min => 311), '4']
    ]
  end
end
