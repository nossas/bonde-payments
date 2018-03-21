class Main
  require 'active_record'
  require_relative './models/recipient'

  def self.db_config
    db_file = File.join(File.expand_path('..',__FILE__), '..', 'db', 'config.yml')
    YAML.load(File.read(db_file))
  end

  def self.connect
    ActiveRecord::Base.establish_connection(db_config["development"])
    puts "Connect Database"
  end

  def self.get_all_recipients
    self.connect
    puts Recipient.first.pagarme_recipient_id
  end

  def self.test_a(status)
    puts "Seu status eh =>>#{status}"
  end
end
