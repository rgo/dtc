require 'mechanize'
require 'nokogiri'

module DataFetcher

  def self.included(base)
    base.extend ClassMethods  
  end

  module ClassMethods

    def data_fetcher(options={})
      cattr_accessor :uri_data_fetcher
      self.uri_data_fetcher = options[:uri]
      
    end
  end
end
