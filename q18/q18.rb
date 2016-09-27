def show_result(n, log)
  puts n
  p log
end

def check(n, sq, log, remain)
  if log.size == n
    show_result(n, log) if sq.include?(1 + log.last)
  else
    (remain - log).find do |i|
       sq.include?(log.last + i) && check(n, sq, log + [i], remain - [i])
    end
  end
end

(2..Float::INFINITY).lazy.find do |n|
  sq = (2..Math.sqrt(n*2)).map { |i| i**2 }
  check(n, sq, [1], (2..n).to_a)
end
