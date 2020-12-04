# frozen_string_literal: true

if Rails.env.production?
  Redis.new(url: ENV['REDIS_URL'])
else
  redis_config = YAML.safe_load(File.open(Rails.root.join('config/redis.yml'))).symbolize_keys[Rails.env.to_sym]
  Redis.new(redis_config)
end
