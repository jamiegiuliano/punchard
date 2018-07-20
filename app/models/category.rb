# frozen_string_literal: true

# Categorizes different links.
class Category < ApplicationRecord
  belongs_to :link
end
