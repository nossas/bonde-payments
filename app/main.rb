require 'active_record'
require 'erb'
require_relative './models/recipient'
require_relative '../config/pagarme'
require_relative '../lib/balance_sync'

class Main
  def sync_recipients(status)
    raise 'missing PAGARME_API_KEY env' if ENV['PAGARME_API_KEY'].nil?
    raise 'missing DATABASE_URL env' if ENV['DATABASE_URL'].nil?
    raise 'missing RUBY_ENV env' if ENV['RUBY_ENV'].nil?
    raise 'missing AMOUNT env' if ENV['AMOUNT'].nil?

    connect

    Recipient.find_each do |recipient|
      begin
        operations_sync = BalanceSync.new(recipient)
        operations_sync.sync_balance_operations(status)
      rescue StandardError => e
        puts e.inspect
      end
    end
  end

  def connect
    ActiveRecord::Base.establish_connection(db_config[ENV['RUBY_ENV']])
    puts "Connect Database on #{ENV['RUBY_ENV']}"
  end

  private
    def db_config
      db_file = File.join(File.expand_path('..',__FILE__), '..', 'config', 'config.yml')
      YAML.load(ERB.new(File.read(db_file)).result)
    end
end
