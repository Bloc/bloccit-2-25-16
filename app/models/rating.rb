class Rating < ActiveRecord::Base
  enum severity: [ :PG, :PG13, :R ]

  has_many :topics
  has_many :posts
  belongs_to :rateable, polymorphic: true
  before_save { self.severity ||= :pg }

  def self.update_rating(rating_string)
    unless rating_string.nil? || rating_string.empty?
      rating_string = rating_string.strip
      Rating.find_or_create_by(severity: rating_string)
    end
  end
end
