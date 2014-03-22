class Video < ActiveRecord::Base
  belongs_to :user

  validates :youtube_url, presence: true
  validates :user_id, presence: true

  before_create :preprocess_data

  URL_Formats = {
        regular: /^(https?:\/\/)?(www\.)?youtube.com\/watch\?(.*\&)?v=([^&]+)/,
        shortened: /^(https?:\/\/)?(www\.)?youtu.be\/([^&]+)/,
        invalid_chars: /[^a-zA-Z0-9\:\/\?\=\&\$\-\_\.\+\!\*\'\(\)\,]/
    }

  private

  def has_invalid_chars?(youtube_url)
    !URL_Formats[:invalid_chars].match(youtube_url).nil?
  end

  def preprocess_data

    if self.hash_id.nil?
      curr_time = Time.now
      self.hash_id = Digest::SHA1.hexdigest(curr_time.to_s + curr_time.usec.to_s)[8..15]
    end

    if self.youtube_id.nil?
      self.youtube_id = extract_video_id(self.youtube_url)
    end

    if self.youtube_embed.nil?
      self.youtube_embed = youtube_embed_url(self.youtube_url)
    end
  end

  def extract_video_id(youtube_url)
    return nil if has_invalid_chars?(youtube_url)

    result = if match = URL_Formats[:regular].match(youtube_url)
      match[4]
    elsif match = URL_Formats[:shortened].match(youtube_url)
      match[3]
    else
      nil
    end

    result
  end

  def youtube_embed_url(youtube_url, width = 420, height = 315)
    return nil if has_invalid_chars?(youtube_url)

    vid_id = extract_video_id(youtube_url)
    %(<iframe width="#{width}" height="#{height}" src="http://www.youtube.com/embed/#{vid_id}?autoplay=1" frameborder="0" allowfullscreen></iframe>)
  end
end
