require "socket"

server = "chat.freenode.net"
port = "6667"
nick = "Sunny_IRC_robot"
channel = "#LakshayTest"
greeting_prefix = "PRIVMSG #LakshayTest :"
greetings = ["Hello", "Play TicTacToe"]
s = TCPSocket.open(server, port)
print("addr: ", s.addr.join(":"), "\n")
print("peer: ", s.peeraddr.join(":"), "\n")
s.puts "USER testing 0 * Testing"
s.puts "NICK #{nick}"
s.puts "JOIN #{channel}"
s.puts "PRIVMSG #{channel} :Hello from IRB Bot"

# puts "What is your name?"
# name = s.gets

# puts "your name is #{name}"



until s.eof? do
  msg = s.gets
  puts msg

wasGreeted = false
greetings.each do |g|
wasGreeted = true if msg.include? g
end

if msg.include? greeting_prefix and wasGreeted
	response = "Game On!"

	s.puts "PRIVMSG #{channel} :#{response}"

end



end