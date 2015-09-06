module Yodabot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      command 'advise' do |client, data, _match|
        send_message client, data.channel, 'Fear is the path to the dark side. Fear leads to anger. Anger leads to hate. Hate leads to suffering.'
      end

      command 'hello' do |client, data, _match|
        send_message client, data.channel, 'PATIENCE YOU MUST HAVE my young padawan. Reactions cath you must'
      end
    end
  end
end
