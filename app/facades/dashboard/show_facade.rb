class Dashboard::ShowFacade < ShowFacade
  def all_killer_achievement_progress
    CalculateProgress.call(user_killer_achievements, killer_achievements)
  end

  def all_location_achievement_progress
    CalculateProgress.call(user_location_achievements, location_achievements)
  end

  def play_chart_data
    return {} if total_plays.zero? || win_loss_play_counts.empty?
    {
      Loss: CalculateProgress.call(loss_count, total_plays),
      Win: CalculateProgress.call(win_count, total_plays)
    }
  end

  private

  def killer_achievements
    @killer_achievements ||= KillerAchievement.count
  end

  def user_killer_achievements
    user.user_killer_achievements.where(completed: true).count
  end

  def location_achievements
    @location_achievements ||= LocationAchievement.count
  end

  def user_location_achievements
    user.user_location_achievements.where(completed: true).count
  end

  def total_plays
    win_loss_play_counts.values.sum
  end

  def win_count
    win_loss_play_counts[true] || 0
  end

  def loss_count
    win_loss_play_counts[false] || 0
  end

  def win_loss_play_counts
    user.plays.group(:is_win).count
  end
end
