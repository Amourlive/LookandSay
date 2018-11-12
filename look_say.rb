# LookSay sequence
class LookSay
  include Enumerable
  def initialize
    @results_array = Enumerator.new do |yielder|
      accumulator = [1]
      loop do
        yielder << accumulator.join.to_i
        accumulator = next_value(accumulator)
      end
    end.lazy
  end

  def next
    @results_array.next
  end

  def rewind
    @results_array.rewind
  end

  def each(&block)
    @results_array.each(&block)
  end

  private

  def next_value(last_value, tmp = [], count = 1)
    last_value.push(0).inject do |previous_val, next_val|
      if previous_val == next_val
        count += 1
      else
        tmp.push(count, previous_val)
        count = 1
      end
      next_val
    end
    tmp
  end
  # last_value is accumulator in previous scope
end