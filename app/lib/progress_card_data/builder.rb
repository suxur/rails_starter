class ProgressCardData::Builder
  def initialize(record, user)
    @record = record
    @user = user
  end

  def to_data
    ProgressCardData[
      @record,
      @record.series.name,
      @record.name,
      calculate_progress,
      @record.icon
    ]
  end

  def self.to_data(...)
    new(...).to_data
  end

  private

  def calculate_progress
    CalculateProgress.new(
      completed_achievements.count,
      total_achievements.count
    ).call
  end

  def completed_achievements
    @user.send(record_achievements).completed(total_achievements)
  end

  def total_achievements
    @record.achievements
  end

  def record_achievements
    "user_#{@record.class.name.downcase}_achievements"
  end
end
