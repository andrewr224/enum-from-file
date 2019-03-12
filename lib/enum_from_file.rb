# frozen_string_literal: true

require "enum_from_file/railtie"
require "enum_from_file/core_ext"

module EnumFromFile
  extend ActiveSupport::Concern

  included do
    include EnumFromFile::CoreExt
  end
end
