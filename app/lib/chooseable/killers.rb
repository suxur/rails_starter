class Chooseable::Killers
  def items
    @items ||= Killer.chooseables
  end

  def id
    :killer_id
  end

  def prompt
    "Choose a Killer"
  end
end
