class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
      scope: [:release_year, :artist_name],
      message: "cannot be repeated by the same artist in the same year"
    }
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validate :release

  def release
    if released && release_year.nil?
      errors.add(:release_year, "can not be blank")
    elsif released && release_year > Date.today.year
      errors.add(:release_year, "can not be future time")
    end
  end

    # with_options if: :released? do |song|
    #   song.validates :release_year, presence: true
    #   song.validates :release_year, numericality: {
    #     less_than_or_equal_to: Date.today.year
    #   }
    # end
    #
    # def released?
    #   released
    # end
end
