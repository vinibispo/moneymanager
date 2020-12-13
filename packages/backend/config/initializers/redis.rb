# frozen_string_literal: true

if Rails.env.production?
  CONN_REDIS = Redis.new(url: ENV['REDIS_URL'])
else
  path_redis = Rails.root.join('config/redis.yml')
  file_redis = File.open(path_redis)
  redis_config = YAML.safe_load(file_redis, aliases: true).symbolize_keys[Rails.env.to_sym]
  CONN_REDIS = Redis.new(redis_config)
end
