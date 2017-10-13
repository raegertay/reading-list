class Book < ApplicationRecord

  validates :name, :author, presence: true

  def self.search(term)
    if term
      lowercase_term = term.downcase
      where('LOWER(name) LIKE ? OR LOWER(author) LIKE ?', "%#{lowercase_term}%", "%#{lowercase_term}%").order(:name, :author)
    else
      all.order(:name, :author)
    end
  end

end
