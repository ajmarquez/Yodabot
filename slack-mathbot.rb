require 'slack-ruby-bot'
require 'slack-mathbot/commands/calculate'

require 'slack-mathbot/app'

require 'slack-ruby-client'



Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  fail 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

client = Slack::RealTime::Client.new

client.on :hello do
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

  puts client.web_client.reactions_list user: data['user']

  client.typing channel: data['channel']

  case data['text']
  when 'bot hi' then
    client.message channel: data['channel'], text: "Hi <@#{data['user']}>, say hello to Mariana for me!"
  when 'mariana says hi' then
    client.message channel: data['channel'], text: "Say Hi, and tell her to stop playing games!"
  end
end




client.start!
