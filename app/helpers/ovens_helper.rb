module OvensHelper

  def consume_range_options_for_oven
    [
        [t('ovens.index.consume_range.less', :max => 1), '1'],
        [t('ovens.index.consume_range.between', :min => 1, :max => 2), '2'],
        [t('ovens.index.consume_range.between', :min => 2, :max => 3), '3'],
        [t('ovens.index.consume_range.greater', :min => 3), '4']
    ]
  end

  def volume_range_options_for_oven
    [
        [t('ovens.index.volume_range.less', :max => 30), '1'],
        [t('ovens.index.volume_range.between', :min => 30, :max => 40), '2'],
        [t('ovens.index.volume_range.between', :min => 40, :max => 55), '3'],
        [t('ovens.index.volume_range.between', :min => 55, :max => 70), '4'],
        [t('ovens.index.volume_range.greater', :min => 3), '5']
    ]
  end
end
