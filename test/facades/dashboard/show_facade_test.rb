require "test_helper"

class Dashboard::ShowFacadeTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @facade = Dashboard::ShowFacade.new(@user)
    @mock_facade = MockFacade.new(@user)
  end

  def test_all_killer_achievement_progress
    assert_equal 40, @facade.all_killer_achievement_progress
  end

  def test_all_location_achievement_progress
    assert_equal 40, @facade.all_location_achievement_progress
  end

  def test_play_chart_data
    assert_equal({ Loss: 50, Win: 50 }, @facade.play_chart_data)
  end

  def test_empty_play_chart_data
    assert_equal({}, @mock_facade.play_chart_data)
  end

  private

  class MockFacade < Dashboard::ShowFacade
    def total_plays
      0
    end
  end
end
