# frozen_string_literal: true

# All other classes will inherit from ApplicationRecord.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
