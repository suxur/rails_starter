class Chooseable::Base
  def items
    raise NotImplementedError
  end

  def id
    raise NotImplementedError
  end

  def prompt
    raise NotImplementedError
  end
end
