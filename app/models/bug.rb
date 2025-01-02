class Bug < ApplicationRecord
  include Hashidify

  serialize :color_scheme, coder: YAML, type: Array

  validates :term, presence: true
  validates :language, presence: true
  validates :translation, presence: true
end
