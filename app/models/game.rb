class Game < ApplicationRecord
  has_and_belongs_to_many :players
  has_many :rounds, dependent: :delete_all
  belongs_to :winner, class_name: "Player", optional: true

  accepts_nested_attributes_for :players
end
