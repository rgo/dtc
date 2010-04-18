module FridgeFreezersHelper

  def consume_range_options_for_fridge_freezer
    [
        [t('fridge_freezers.index.consume_range.less', :max => 300), '1'],
        [t('fridge_freezers.index.consume_range.between', :min => 300, :max => 400), '2'],
        [t('fridge_freezers.index.consume_range.between', :min => 400, :max => 500), '3'],
        [t('fridge_freezers.index.consume_range.greater', :min => 500), '4']
    ]
  end

end
