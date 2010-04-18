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
end
