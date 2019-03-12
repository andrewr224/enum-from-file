# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  include EnumFromFile

  self.abstract_class = true
end
