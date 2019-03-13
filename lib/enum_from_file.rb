# frozen_string_literal: true

require "enum_from_file/railtie"
require "enum_from_file/core_ext"

class ActiveRecord::Base
  include EnumFromFile::CoreExt
end
