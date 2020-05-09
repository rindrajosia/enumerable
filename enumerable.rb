module Enumerable
  def my_each
    array_enum = self
    i = 0
    while i < array_enum.length
      yield(array_enum[i]) if block_given?
      i += 1
    end
    array_enum
  end

  def my_each_with_index
    array_enum = self
    i = 0
    while i < array_enum.length
      yield(array_enum[i], i) if block_given?
      i += 1
    end
    array_enum
  end
end
