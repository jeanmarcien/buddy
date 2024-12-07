class Activity < ApplicationRecord
  belongs_to :pet

  TRAINING_TYPES = ['sit', 'stay', 'roll over', 'heel']

  validates :training_type, inclusion: { in: TRAINING_TYPES }

  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  validates :video_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: 'must be a valid URL' }, allow_blank: true
end
