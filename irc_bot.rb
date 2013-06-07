require "socket"
require_relative "wikibot"
#require_relative "tictactoe_runner.rb"

server = "chat.freenode.net"
port = "6667"
nick = "wikibot"
channel = "#LakshayTest"
greeting_prefix = "PRIVMSG #LakshayTest :"
greetings = ["SearchWiki"]
s = TCPSocket.open(server, port)
print("addr: ", s.addr.join(":"), "\n")
print("peer: ", s.peeraddr.join(":"), "\n")
s.puts "USER testing 0 * Testing"
s.puts "NICK #{nick}"
s.puts "JOIN #{channel}"
s.puts "PRIVMSG #{channel} :Hello type 'SearchWiki'"


def say(socket, msg, greeting_prefix = "PRIVMSG #LakshayTest :")
	socket.puts( greeting_prefix + msg )
end

# puts "What is your name?"
# name = s.gets

# puts "your name is #{name}"
wb = Wikibot.new

until s.eof? do
  msg = s.gets
  puts msg

  wasGreeted = false
  
  greetings.each do |greeting| #SearchWiki
  	# puts ">>>> This is message: #{msg}"

    if  msg.downcase.include? "searchwiki"
    #msg.downcase  == greeting.downcase #SearchWiki

    say(s, "Enter A search term")
    searchterm = s.gets
    result = /:(?!.*:)(.*$)/.match(searchterm)[1]
    #say(s, "#{result}")
    say(s,  wb.searchWiki("#{result}").to_s)

   # wb.searchwiki("#{result}")


      #puts "I found searchwiki. now trying to output my message"
    	
     # wasGreeted = true 
     # say(s, "Im inside biatch!")
  	  # s.puts "**** Enter a search term"

    #  searchterm = s.gets
     # result = /:(?!.*:)(.*$)/.match(searchterm)[1]
      #s.puts "PRIVMSG #{channel} :#{result}"
    end
  end



  # if msg.include? greeting_prefix and wasGreeted
   # s.puts "About to send out a message!"
   #response = "w00t! Someone talked to us!!!! Hello!!!"
   # s.puts "PRIVMSG #{channel} :#{response}"
end