# frozen_string_literal: true

module EnumFromFile
  class Storage
    include Singleton

    def initialize
      enum_files.each(&method(:define_enum))
    end

    def values_from(file:)
      send(file)
    rescue NoMethodError
      raise StandardError, "Cannot read 'config/enums/#{file}.yml'"
    end

    private

    def enum_files
      Dir["#{project_root}/config/enums/*.yml"].map { |path| File.open(path) }
    end

    def project_root
      return Rails.root   if defined?(Rails)
      return Bundler.root if defined?(Bundler)

      Dir.pwd
    end

    def define_enum(file)
      define_singleton_method File.basename(file.path, ".yml") do
        instance_variable_get(instance_name(file)) ||
          instance_variable_set(instance_name(file), instance_value(file))
      end
    end

    def instance_name(file)
      "@#{File.basename(file.path, '.yml').to_sym}"
    end

    def instance_value(file)
      values = YAML.safe_load(file)

      return values.to_h unless values.is_a?(String)

      Hash[values.split.map { |val| [val.to_sym, val] }]
    end
  end
end
