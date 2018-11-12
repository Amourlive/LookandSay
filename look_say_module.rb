# Второй вариант
module LookSay
  def self.lazy_sequence
    Enumerator.new do |yielder|
      accumulator = [1]
      loop do
        yielder << accumulator.join.to_i
        tmp = []
        count = 1
        accumulator.push(0).inject do |previous_val, next_val|
          if previous_val == next_val
            count += 1
          else
            tmp.push(count, previous_val)
            count = 1
          end
          next_val
        end
        accumulator = tmp
      end
    end.lazy
  end

  def self.[](key)
    accumulator = [1]
    key.times do
      tmp = []
      count = 1
      accumulator.push(0).inject do |previous_val, next_val|
        if previous_val == next_val
          count += 1
        else
          tmp.push(count, previous_val)
          count = 1
        end
        next_val
      end
      accumulator = tmp
    end
    accumulator.join.to_i
  end
end

p a = LookSay.lazy_sequence
p a.next
p a.first(10)
p LookSay[50]