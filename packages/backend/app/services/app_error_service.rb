# frozen_string_literal: true

# Service generated for handle error
class AppErrorService < StandardError
  attr_reader :message, :status_code

  def initialize(message, status_code = :bad_request)
    @message = message
    @status_code = status_code
    super(message)
  end
end
