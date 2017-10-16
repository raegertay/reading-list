class Book < ApplicationRecord

  validates :name, :author, presence: { message: "%{attribute} is mandatory" }
  validate :same_book_already_exist, on: :create

  # Return matched name or author based on (search) term
  def self.search(search_term)
    lowercase_term = search_term.downcase
    where('LOWER(name) LIKE ? OR LOWER(author) LIKE ?', "%#{lowercase_term}%", "%#{lowercase_term}%")
  end

  def same_book_already_exist
    matched_book = Book.where('LOWER(name) = LOWER(?) AND LOWER(author) = LOWER(?)', name, author)
    errors.add(:base, :same_book_exist, message: 'Book already exist') if matched_book.any?
  end

end
