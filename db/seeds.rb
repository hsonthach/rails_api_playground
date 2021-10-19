require 'net/http'

def now
  Process.clock_gettime(Process::CLOCK_MONOTONIC)
end

# start_sequential = now

# 3.times.map do
#   3.times do
#     Net::HTTP.get('example.com', '/index.html')
#   end
# end

# finish_sequential = now
# puts "Sequential duration #{finish_sequential - start_sequential}"

start_concurrent = now

3.times.map do
  3.times.map do
    Thread.new do
      Net::HTTP.get('example.com', '/index.html')
    end
  end
end.each(&:join)

finish_concurrent = now
puts "Concurrent duration: #{finish_concurrent - start_concurrent}"
