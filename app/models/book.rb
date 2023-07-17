class Book < ApplicationRecord
  enum sales_status: {
    reservation: 0, # 予約受付
    now_on_sale: 1, # 発売中
    end_of_print: 2, # 販売終了
  }

  scope :costly, -> { where("price > ?", 3000) }
  scope :written_about, ->(theme) { where("name like ?", "%#{theme}%")}

  after_destroy :if => :high_price? do |record|
    Rails.logger.info "Book is deleted: #{record.attributes.inspect}"
    Rails.logger.info "Please check!!"
  end

  def high_price?
    price >= 5000
  end

  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :name, presence: true
  validates :name, length: { maximum: 25 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }


  # 自作のバリデーション
  validate do |book|
    if book.name.include?("入門")
      book.errors[:name] << "「入門」の本は作成できません"
    end
  end
end
