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

  def my_select
    array_enum = self
    res_array = []
    if block_given?
      array_enum.my_each do |item|
        res_array << item if yield(item)
      end
    else
      res_array = array_enum
    end
    res_array
  end

  def my_all?(*args, &block)
    array_enum = self
    flag = true
    if array_enum.empty?
      flag = true
    elsif !args[0].nil? && args[0].class == Class
      array_enum.my_each do |item|
        flag = false unless item.is_a?(args[0])
      end
    elsif !args[0].nil?
      array_enum.my_each do |item|
        flag = false unless item == args[0]
      end
    elsif !block.nil?
      array_enum.my_each do |item|
        flag = false unless block.call(item)
      end
    else
      flag = false
    end
    flag
  end
end
