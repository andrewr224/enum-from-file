# frozen_string_literal: true

require "enum_from_file/storage"

module EnumFromFile
  module CoreExt
    extend ActiveSupport::Concern

    class_methods do
      def enum(enum_name = {}, **options)
        if options.key?(:from_file)
          options[enum_name] = enum_from_file(file: options.delete(:from_file))
        end

        super(options)
      end

      private

      def enum_from_file(file:)
        EnumFromFile::Storage.instance.send(file)
      end
    end
  end
end
