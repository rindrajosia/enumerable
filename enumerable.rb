# CyclomaticComplexity Bug
# rubocop:disable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
module Enumerable
  def my_each
    array_enum = is_a?(Range) ? to_a : self
    i = 0
    while i < array_enum.length
      yield(array_enum[i]) if block_given?
      i += 1
    end
    array_enum
  end

  def my_each_with_index
    array_enum = is_a?(Range) ? to_a : self
    i = 0
    while i < array_enum.length
      yield(array_enum[i], i) if block_given?
      i += 1
    end
    array_enum
  end

  def my_select
    array_enum = is_a?(Range) ? to_a : self
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
    array_enum = is_a?(Range) ? to_a : self
    flag = true
    if array_enum.empty?
      flag = true
    elsif !args[0].nil? && args[0].class == Class
      array_enum.my_each { |item| flag = false unless item.is_a?(args[0]) }
    elsif !args[0].nil?
      array_enum.my_each { |item| flag = false unless item == args[0] }
    elsif !block.nil?
      array_enum.my_each { |item| flag = false unless block.call(item) }
    else
      flag = false
    end
    flag
  end

  def my_any?(*args, &block)
    array_enum = is_a?(Range) ? to_a : self
    flag = false
    if array_enum.empty?
      flag = false
    elsif !args[0].nil? && args[0].class == Class
      array_enum.my_each { |item| flag = true if item.is_a?(args[0]) }
    elsif !args[0].nil?
      array_enum.my_each { |item| flag = true if item == args[0] }
    elsif !block.nil?
      array_enum.my_each { |item| flag = true if block.call(item) }
    else
      flag = true
    end
    flag
  end

  def my_none?(*args, &block)
    array_enum = is_a?(Range) ? to_a : self
    flag = true
    if array_enum.empty?
      flag = true
    elsif !args[0].nil? && args[0].class == Class
      array_enum.my_each { |item| flag = false if item.is_a?(args[0]) }
    elsif !args[0].nil?
      array_enum.my_each { |item| flag = false if item == args[0] }
    elsif !block.nil?
      array_enum.my_each { |item| flag = false if block.call(item) }
    else
      array_enum.my_each { |item| flag = false if item }
    end
    flag
  end

  def my_count(*args, &block)
    array_enum = is_a?(Range) ? to_a : self
    count = 0
    if block.nil? && args[0].nil?
      array_enum.my_each { |item| count += 1 if item }
    elsif block.nil? && !args[0].nil?
      array_enum.my_each { |item| count += 1 if item == args[0] }
    else
      array_enum.my_each { |item| count += 1 if block.call(item) }
    end
    count
  end

  def my_map(&block)
    array_enum = is_a?(Range) ? to_a : self
    res_array = []
    if block_given?
      array_enum.my_each do |item|
        res_array << block.call(item)
      end
    else
      res_array = array_enum
    end
    res_array
  end
end

# rubocop:enable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
