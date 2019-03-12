# frozen_string_literal: true

require "rails_helper"
require "enum_from_file/storage"

describe EnumFromFile::Storage do
  subject(:storage) { described_class.instance }

  enums = %i[breeds eye_colors]

  describe "defines methods for .yml files in config/enums folder" do
    enums.each do |method|
      it { expect(storage).to respond_to(method) }
    end
  end

  describe "returns hashes for each method" do
    enums.each do |method|
      it "returns a hash for ##{method}" do
        expect(storage.send(method)).to be_a Hash
      end
    end
  end
end
