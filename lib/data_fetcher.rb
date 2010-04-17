require 'mechanize'
require 'nokogiri'

module DataFetcher

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods

    def data_fetcher(options={})
      cattr_accessor :uri_data_fetcher, :form_data_fetcher, :search_selector, :fetch_mapping
      self.uri_data_fetcher = options[:uri]
      self.form_data_fetcher = options[:form]
      self.search_selector = options[:selector]
      self.fetch_mapping = options[:fetch_mapping] || {}
    end

    def fetch
      agent = Mechanize.new

      agent.get(self.uri_data_fetcher)
      form = agent.page.form(self.form_data_fetcher)
      doc = form.submit

      begin
        doc.search(self.search_selector).each do |row|
          object = self.new
          self.fetch_mapping.each do |value, method|
            row.search("td[@headers='#{value}']").each do |data|
              object.send("#{method}=", data.text)
            end
          end
          object.save!
        end
      end while (agent.page.link_with(:text => 'Siguiente >') && doc = agent.page.link_with(:text => 'Siguiente >').click)
    end
  end
end
