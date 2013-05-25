module Lengthable
  def length
    rand length_min..length_max
  end

  def length_min
    if min_no_max?
      min
    elsif max_no_min?
      if max < default_min
        low_limit
      else
        default_min
      end
    elsif min_and_max?
      if min <= max
        min
      else
        default_min
      end
    else
      default_min
    end
  end

  def length_max
    if max_no_min?
      max
    elsif min_no_max?
      if min > default_max
        high_limit
      else
        default_max
      end
    elsif min_and_max?
      if min <= max
        max
      else
        default_max
      end
    else
      default_max
    end
  end

  def default_min
    0
  end

  def default_max
    0
  end

  def low_limit
    0
  end

  def high_limit
    0
  end

  def min_no_max?
    !min.nil? && max.nil?
  end

  def max_no_min?
    !max.nil? && min.nil?
  end

  def min_and_max?
    !min.nil? && !max.nil?
  end

  def min
    raise NotImplementedError, "This #{self.class} cannot respond to:"
  end

  def max
    raise NotImplementedError, "This #{self.class} cannot respond to:"
  end
end
