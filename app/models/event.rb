class Event < ApplicationRecord
  
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :venue, :menu, :cuisine, :description ],
    associated_against: {
      user: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user
  has_many :tickets, dependent: :destroy
  has_many_attached :photos
  validates :user_id, :venue, :menu, :cuisine, :price, :description, :capacity, :date, presence: true
  geocoded_by :venue
  after_validation :geocode, if: :will_save_change_to_venue?
end
