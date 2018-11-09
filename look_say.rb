# LookSay sequence
class LookSay
  include Enumerable
  LENGTH = 1
  def initialize
    @accumulator = [1]
    @results_array = Enumerator::Lazy.new(1..Float::INFINITY) do |yielder, val|
      yielder << (val == 1 ? val : next_value(@accumulator).join.to_i)
    end
  end

  def next
    @results_array.next
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
    @accumulator = tmp
  end
  # last_value is @accumulator in previous scope
end