class Bookmark < ApplicationRecord

  belongs_to :book

  validates :page_number, presence: { message: '%{attribute} is mandatory' }
  validates :page_number, numericality: { only_integer: true, message: 'Page number must be an integer'}
  validates :page_number, numericality: { greater_than: 0, message: 'Page number must be greater than %{value}'}

end
