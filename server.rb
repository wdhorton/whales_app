require 'webrick'
require_relative './routes'

def start_server(router)
  server = WEBrick::HTTPServer.new(Port: 3000)
  server.mount_proc('/') do |req, res|
    route = router.run(req, res)
  end

  trap('INT') { server.shutdown }

  server.start
end
