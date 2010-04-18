class ComparatorController < ApplicationController

  before_filter :capitalize_class

  def show
    @items = params[:klass].capitalize.constantize.find(session[params[:klass]])
    render "/comparator/#{params[:klass].downcase}/show"
  end

  def add
    session[params[:klass]] ||= []

    unless session[params[:klass]].include? params[:id]
      session[params[:klass]] << params[:id]    
      notice_sticky = t('comparator.add.added')
    else
      notice_sticky = t('comparator.add.already_added')
    end
  end

  def remove

    if session[params[:klass]].include? params[:id]
      session[params[:klass]].delete params[:id]
      notice_sticky = t('comparator.remove.removed')
    else
      notice_sticky = t('comparator.remove.not_present')
    end
  end

  private
  
  def capitalize_class
    params[:klass].capitalize!
  end

end
