# frozen_string_literal: true

Devise.setup do |config|
  config.secret_key = '409208785261b124610735d516ad2ff792b796213c3e71ed67467
                      882db275536c5964c453bbfb6dc114b14a134951827767b4a55c15
                      feb026cdc6874d5344782'
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  # OmniAuth
  config.omniauth :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end
