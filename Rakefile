require 'webrick'

desc "Start the preview server."
task :start do
  server = WEBrick::HTTPServer.new(Port: 3000, DocumentRoot: File.expand_path('../_site', __FILE__))
  trap('INT') { server.shutdown }
  server.start
end

task :default => :start
