# frozen_string_literal: true

require "rails_helper"

describe Cat do
  describe "class methods" do
    subject(:model) { described_class }

    enums         = %i[breeds eye_colors]
    regular_enums = %i[sexes]

    enums.each do |method|
      it { expect(model).to respond_to(method) }
    end

    describe "doesn't break regular enums" do
      regular_enums.each do |method|
        it { expect(model).to respond_to(method) }
      end
    end
  end

  describe "instance methods" do
    subject(:instance) { described_class.new }

    eye_color_methods = %w[blue copper yellow gold orange green red]

    eye_color_methods .each do |method|
      predicate_method = "#{method}?".to_sym

      it "responds to predicate method #{predicate_method}" do
        expect(instance).to respond_to(predicate_method)
      end
    end

    eye_color_methods .each do |method|
      bang_method = "#{method}!".to_sym

      it "responds to bang method #{bang_method}" do
        expect(instance).to respond_to(bang_method)
      end
    end
  end
end
