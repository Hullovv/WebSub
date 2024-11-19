require 'sinatra'
require 'json'
require 'logger'

set :port, 9955
set :bind, '0.0.0.0'

class Application < Sinatra::Base
  use Rack::Reloader

  get '/' do
    { message: 'hello' }.to_json
  end

  get '/home' do
    puts 123
  end

  get '/websub_callback' do
    puts request.params
  end

  get '/*' do
    puts request.body
    puts request.method
  end

  class Logger
    attr_reader :level

    def initialize(level = :debug); end
  end
end
