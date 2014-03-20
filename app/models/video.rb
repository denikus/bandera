class Video < ActiveRecord::Base
  belongs_to :user

  validates :url, presence: true
  validates :user_id, presence: true

  private

  def generate_hash_id
    if self.hash_id.nil?
      curr_time = Time.now
      self.hash_id = Digest::SHA1.hexdigest(curr_time.to_s + curr_time.usec.to_s)[8..15]
    end
  end
end
