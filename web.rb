require 'sinatra/base'

module Yodabot
  class Web < Sinatra::Base
    get '/' do
      'Math is good for you.'
    end
  end
end
