class Chooseable::Locations
  def items
    @items ||= Location.chooseables
  end

  def id
    :location
  end

  def prompt
    "Choose a Location"
  end
end
