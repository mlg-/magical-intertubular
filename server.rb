require 'sinatra'
require 'sinatra/json'
require 'httparty'
require 'pry'
require 'snooby'

class Tag
  attr_accessor :name, :frequency

  def initialize(name, frequency)
    @name = name
    @frequency = frequency
  end

  def all_in_desc_order(tags)
    tags.sort_by(frequency)
  end
end

get '/api/v1/tags' do
  response = HTTParty.get('https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&site=stackoverflow')
  tags = Hash.new 0
  questions = response["items"]
  questions.each do |question|
    question["tags"].each do |tag|
      tags[tag] += 1
    end
  end
  sorted_tags = []
  tags.each do |k, v|
    sorted_tags << Tag.new(name = k, frequency = v)
  end
  json sorted_tags
end

get '/' do
  response = HTTParty.get('https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&site=stackoverflow')
  tags = Hash.new 0
  questions = response["items"]
  questions.each do |question|
    question["tags"].each do |tag|
      tags[tag] += 1
    end
  end
  sorted_tags = []
  tags.each do |k, v|
    sorted_tags << Tag.new(name = k, frequency = v)
  end
  erb :index, locals: { tags: sorted_tags }
end
