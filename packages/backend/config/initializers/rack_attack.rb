# frozen_string_literal: true

module Rack
  # Initializer to block brutte force and block DDOS
  class Attack
    throttle('req/ip', limit: 300, period: 5.minutes, &:ip)
    throttle('logins/email', limit: 5, period: 20.seconds) do |req|
      req.params['email'].presence unless req.path != '/auth_router' && !req.post?
    end
  end
end
