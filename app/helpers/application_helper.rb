# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def rating_to_percentage(rating = 0)
    value = (10/rating.to_i).to_f * 10
    number_to_percentage(value, :precision => 0)
  end

  def selected_for_boolean(value)
    if ['1',true].include? value
      '1'
    elsif ['0', false].include? value
      '0'
    else
      ' '
    end
  end

  def comparator_link(item, class_name = nil, options = {})
    item = class_name.classify.constantize.find(item) if class_name.present?
    options.reverse_merge!({:class => 'comparate'})

    resources = item.class.to_s.tableize
    if(session[resources].try :include?, item.id)
      link_to t('general.remove_from_comparator'), remove_from_comparator_url(:klass => item.class.to_s.underscore, :id => item.id),
              :class => options[:class], :id => "#{resources}-#{item.id}"
    else
      link_to t('general.add_to_comparator'), add_to_comparator_url(:klass => item.class.to_s.underscore, :id => item.id),
              :class => options[:class], :id => "#{resources}-#{item.id}"
    end
  end

  def comparator_section(message, klass)

    str = ''
    str << '<div id="comparator">'
    str << "<h3>#{t('.h3_comparator')}</h3>"
    str << "<p>#{message}</p>"
    str << link_to(t('.comparator'), comparator_path(:klass => klass))
    str << '</div>'

    str 
      
  end


end
