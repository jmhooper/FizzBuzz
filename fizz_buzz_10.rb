require 'socket'

server = TCPServer.open(3000)
loop {
  Thread.new(server.accept) do |client|
    puts client.gets
    puts 'I am here'
    client.close
  end
}
