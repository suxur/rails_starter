class CalculateProgress
  def initialize(completed, total)
    @completed = completed
    @total = total
  end

  def self.call(completed, total)
    new(completed, total).call
  end

  def call
    return 0 if total_is_zero?
    ((completed / total) * 100).round.to_i
  end

  private

  def completed
    @completed.to_f
  end

  def total
    @total.to_f
  end

  def total_is_zero?
    total.zero?
  end
end
