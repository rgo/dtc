# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def rating_to_percentage(rating = 0)
    value = (10/rating.to_i).to_f * 10
    number_to_percentage(value, :precision => 0)
  end

  def comparator_link(item, class_name = nil)
    debugger
    item = class_name.classify.constantize.find(item) if class_name.present?

    resources = item.class.to_s.tableize
    if(session[resources].try :include?, item.id)
      link_to t('general.remove_from_comparator'), remove_from_comparator_url(:klass => item.class.to_s.underscore, :id => item.id),
              :class => "comparate", :id => "#{resources}-#{item.id}"
    else
      link_to t('general.add_to_comparator'), add_to_comparator_url(:klass => item.class.to_s.underscore, :id => item.id),
              :class => "comparate", :id => "#{resources}-#{item.id}"
    end
  end
end
