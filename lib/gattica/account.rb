require 'rubygems'
require 'hpricot'

module Gattica
  
  # Represents an account that an authenticated user has access to
  
  class Account
    
    include Convertible
    
    attr_reader :id, :updated, :title, :table_id, :account_id, :account_name, :profile_id, :web_property_id, :goals
  
    def initialize(xml)
      @id = xml.at(:id).inner_html
      @updated = DateTime.parse(xml.at(:updated).inner_html)
      @title = xml.at(:title).inner_html
      @table_id = xml.at('dxp:tableid').inner_html
      @account_id = xml.at("dxp:property[@name='ga:accountId']").attributes['value'].to_i
      @account_name = xml.at("dxp:property[@name='ga:accountName']").attributes['value']
      @profile_id = xml.at("dxp:property[@name='ga:profileId']").attributes['value'].to_i
      @web_property_id = xml.at("dxp:property[@name='ga:webPropertyId']").attributes['value']

      @goals = xml.search('ga:goal').collect do |goal| { 
        :active => goal.attributes['active'],
        :name => goal.attributes['name'],
        :number => goal.attributes['number'].to_i,
        :value => goal.attributes['value'].to_f,
      }
      
      end
    end
    
  end
end
