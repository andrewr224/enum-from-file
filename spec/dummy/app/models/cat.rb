# frozen_string_literal: true

class Cat < ApplicationRecord
  enum :breed,     from_file: :breeds
  enum :eye_color, from_file: :eye_colors

  enum sex: { male: :male, female: :female }
end
