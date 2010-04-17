require 'mechanize'
require 'nokogiri'

module DataFetcher

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods

    def data_fetcher(options={})
      cattr_accessor :uri_data_fetcher, :form_data_fetcher, :search_selector, :agent
      self.uri_data_fetcher = options[:uri]
      self.form_data_fetcher = options[:form]
      self.search_selector = options[:selector]
      self.agent = Mechanize.new
    end

    def fetch
      inserts = 0

      agent.get(uri_data_fetcher)
      form = agent.page.form(form_data_fetcher)
      doc = form.submit

      begin
        doc.search(search_selector).each do |row|
          object = self.new
          self.fetch_mapping.each do |key, method|
            row.search("td[@headers='#{key.to_s}']").each do |data|
              if method.is_a?(Array)
                object.send("#{method.first}=", method.last.call(data.text))
              else
                object.send("#{method}=", data.text)
              end
            end
          end
          inserts += 1 if object.save!
        end
      end while (agent.page.link_with(:text => 'Siguiente >') && doc = agent.page.link_with(:text => 'Siguiente >').click)
    end
  end
end
