require 'rubygems'
require 'mechanize'
require 'awesome_print'


def goto(url)
  agent = Mechanize.new #{|a| a.log = Logger.new(STDERR) }
  agent.user_agent_alias =  'Linux Mozilla'
  agent.get(url)
end


def parsing(page)
  posts = []

  parse = page.search('#body > div.quote')
  parse.each { |quote|
    post = {
        :id => quote.search('a.id').text,
        :date => quote.search('span.date').text,
        :rating => quote.search('span.rating-o').text,
        :text => quote.search('div.text').text
    }
    posts << post
  }

  # posts.each { |post| puts post.to_json }
  puts posts.to_json
  puts "All: #{posts.count}"
end

