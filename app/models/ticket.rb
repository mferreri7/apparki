class Ticket < ApplicationRecord
  STATUS_CHOICES = %w[pagado pendiente reportado]
  belongs_to :parking_zone
  belongs_to :vehicle

  mount_uploader :picture, PhotoUploader

  validates :entry, :status, presence: true
  validates :status, inclusion: { in: STATUS_CHOICES }
end
