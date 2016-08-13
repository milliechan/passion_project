#!/usr/bin/ruby
# require 'rubygems'
# gem 'google-api-client', '>0.7'
# require 'google/api_client'
# require 'trollop'

class Song < ActiveRecord::Base
  belongs_to :user 
  validates :title, :url, presence: true 
end 