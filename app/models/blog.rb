class Blog < ApplicationRecord
	belongs_to :user
	validates :blog_name, presence: true
  validates :blog_score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 50 }
  validates :content, presence: true
  scope :high_score, -> { where('blog_score >= ?', 80) }
  after_save :message

  def summary
    "#{blog_name}: #{content.truncate(50)}"
  end
  
  private

  def message
    puts "successfully save"
  end
end
