$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'yodabot'
require 'web'

Thread.new do
  begin
    Yodabot::App.instance.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run Yodabot::Web
