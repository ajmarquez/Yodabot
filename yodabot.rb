require 'slack-ruby-bot'
require 'yodabot/commands/calculate'

require 'yodabot/app'

require 'slack-ruby-client'



Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  fail 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

client = Slack::RealTime::Client.new

client.on :hello do |data|
  puts "Successfully connected, welcome '#{client.self['name']}' to the '#{client.team['name']}' team at https://#{client.team['domain']}.slack.com."

end

client.on :message do |data|
  puts data

  #  Para poder acceder a la API web es necesarion colocar 'web_client' despues de declarar el cliente,
  #  por ejemplo:
  #
  #  client.web_client.reactions_list
  #
  #  Este metodo en particular se encarga de recoger la lista de reacciones utilizadas en el chat y devuelve un JSON
  #  que contiene las reaciones el mensaje y demás. Para tomar las reacciones de un usuario en particular se agrega
  #  user: data['user']
  #
  #  Al realizar client.web_client.reactions_list user: data['user'] se obtiene a lista del usuario en particular
  #  que escribió el último mensaje.
  #
  #  TO-DO:
  #  1.- Parsear por el JSON y reconocer las reacciones determinadas.
  #  2.- Con algun comando recoger las reacciones a trackear. Esto puede ser al hablar con el bot
  #  3.- El nombre de mathBot a Yodabot cambiar se debe. Una imagen correspondiente, debe agregarse.
  #
  #

  reactionData = client.web_client.reactions_list user: data['user']

  c=0

  reactionData['items'].each { |x|
    if x['type']=='message'
      c+=1
      puts "One Message"

      x['message']['reactions'].each {|y|

        puts y['name']
      }
      
    end

  }




  #puts "**** TEST  '#{reactionData['items']}' "
  client.typing channel: data['channel']




  case data['text']
  when 'hello', 'yodabot hi' then
    client.message channel: data['channel'], text: "Hi <@#{data['user']}>. Code you must!"
  when 'talk' then
    client.message channel: data['channel'], text: "PATIENCE YOU MUST HAVE my young padawan. Reactions cath you must!"
  end


end




client.start!
