class ComparatorController < ApplicationController

  before_filter :tableize_klass, :only => [:index, :add, :remove]

  before_filter :find_items, :only => [:index, :compare]

  def index
  end

  def add
    session[@klass] = [] if session[@klass].blank?

    unless session[@klass].include? params[:id].to_i
      session[@klass] << params[:id].to_i

      notice_sticky = t('comparator.add.added')
    else
      notice_sticky = t('comparator.add.already_added')
    end

    redirect_to :back
  end

  def remove

    if session[@klass].include? params[:id].to_i
      session[@klass].delete params[:id].to_i
      notice_sticky = t('comparator.remove.removed')
    else
      notice_sticky = t('comparator.remove.not_present')
    end

    redirect_to :back
  end

  def compare(options={})
    @items.sort_by{|item| item.estimate(options)}
  end

  private
  
  def tableize_klass
    @klass = params[:klass].tableize
  end

  def find_items
    @items = params[:klass].capitalize.constantize.try :order_for_comparation, session[params[:klass].tableize]
  end

end
