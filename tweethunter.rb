require 'rubygems'
require 'tweetstream'
require 'mongo' #versão 1.0.8

usage = "USAGE: <user> <password> <search> "
abort usage unless user = ARGV.shift
abort usage unless password = ARGV.shift
abort usage unless search = ARGV.shift

puts "Procurando #{search} ..."
@tweets = []
TweetStream::Client.new(user, password).track(search) do |s, client|  
  @tweets << s
  client.stop if @tweets.size >= 5
end

#Conecta no mongo em localhost
puts "Coletados #{@tweets.size}"
values = { :th_tag => search, :tweets => @tweets  }
db = Mongo::Connection.new.db("th")
coll = db["hunters"]
coll.insert(values)
puts "Total registros #{coll.count()}"