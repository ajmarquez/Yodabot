module SlackMathbot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      command 'calculate' do |client, data, _match|
        send_message client, data.channel, '4'
      end

      command 'hello' do |client, data, _match|
        send_message client, data.channel, 'Hello there!!!'
      end
    end
  end
end
