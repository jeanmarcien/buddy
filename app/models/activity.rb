class Activity < ApplicationRecord
  belongs_to :pet
  has_one_attached :video

  TRAINING_TYPES = ['Sit', 'Stay', 'Roll over', 'Heel']

  validates :training_type, inclusion: { in: TRAINING_TYPES }

  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  def correct_video_mime_type
    if video.attached? && !video.content_type.in?(%w[video/mp4 video/quicktime video/mpeg video/avi])
      errors.add(:video, 'must be a valid video format (mp4, quicktime, mpeg, avi)')
    end
  end
end
