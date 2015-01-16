require 'rubygems'
require 'mechanize'
require 'awesome_print'


def parse

  posts = []

  agent = Mechanize.new #{|a| a.log = Logger.new(STDERR) }
  agent.user_agent_alias =  'Linux Mozilla'

  page = agent.get('http://bash.im/')

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

  ap posts

end
