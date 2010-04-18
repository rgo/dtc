module WashingMachinesHelper

   def consume_range_options_for_washing_machine
    [
        [t('washing_machines.index.consume_range.less', :max => 1), '1'],
        [t('washing_machines.index.consume_range.between', :min => 1, :max => 2), '2'],
        [t('washing_machines.index.consume_range.between', :min => 2, :max => 3), '3'],
        [t('washing_machines.index.consume_range.greater', :min => 3), '4']
    ]
   end

   def rpm_range_options_for_washing_machine
    [
        [t('washing_machines.index.rpm_range.less', :max => 1), '1'],
        [t('washing_machines.index.rpm_range.between', :min => 1, :max => 2), '2'],
        [t('washing_machines.index.rpm_range.between', :min => 2, :max => 3), '3'],
        [t('washing_machines.index.rpm_range.greater', :min => 3), '4']
    ]
   end

end
