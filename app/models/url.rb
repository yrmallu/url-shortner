class Url < ApplicationRecord
  # TODO: IT IS NOT QUIET GOOD!
  validates :url, presence: true,
                  format: { with: /\A(http|https):\/\/(\S+)\z/ }
  validates :url_id, presence: true,
                     uniqueness: { case_sensitive: true }
  validates :status, inclusion: [true, false]
end
