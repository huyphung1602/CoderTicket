class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :owner, class_name: 'User'
  has_many :ticket_types
  validates_presence_of :extended_html_description, :venue, :category, :starts_at, :name
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}
  scope :published, -> { where.not(published_at: nil) }

  def self.published_and_upcoming
    published.where("starts_at > ?", Time.now)
  end

  delegate :name, to: :venue, allow_nil: true, prefix: true

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
