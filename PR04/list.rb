require_relative './deque.rb'
class List
  def run
    deque = Deque.new(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'])
    printf "#{deque.get_daten()} \n"
    print "#{deque.push('k')} \n"
    printf "#{deque.get_daten()} \n"
    print "#{deque.pop()} \n"
    printf "#{deque.get_daten()} \n"
    print "#{deque.enqueue('1')} \n"
    printf "#{deque.get_daten()} \n"
    print "#{deque.dequeue()} \n"
    printf "#{deque.get_daten()} \n"
    16.times do
        print "#{deque.pop()} \n"
    end
    3.times do
      printf "#{deque.get_daten()} \n"
      print "#{deque.push('k')} \n"
    end
    printf "#{deque.get_daten()} \n"
    12.times do
      print "#{deque.pop()} \n"
    end
    12.times do
        print "#{deque.dequeue()} \n"
    end
    7.times do
      printf "#{deque.get_daten()} \n"
      print "#{deque.enqueue('1')} \n"
    end
  end
end