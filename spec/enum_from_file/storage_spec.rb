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
    enums.each do |enum|
      it "returns a hash for ##{enum}" do
        expect(storage.values_from(file: enum)).to be_a Hash
      end
    end
  end

  context "when file does not exist" do
    let(:absent_enum) { :absent_enum }

    it "raises error" do
      expect { storage.values_from(file: absent_enum) }
        .to raise_error StandardError
    end
  end
end
