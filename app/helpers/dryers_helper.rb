module DryersHelper

  def consume_range_options_for_dryer
    [
      [t('dryers.index.consume_range.less', :max => 2.5), '1'],
      [t('dryers.index.consume_range.between', :min => 2.5, :max => 3.5), '2'],
      [t('dryers.index.consume_range.between', :min => 3.5, :max => 4.5), '3'],
      [t('dryers.index.consume_range.greater', :min => 4.5), '4']
    ]
  end
end
