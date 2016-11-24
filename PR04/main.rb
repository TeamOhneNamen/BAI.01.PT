# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

# main methode
require_relative './deque.rb'

deque = Deque.new(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'])

#ich gebe jeweils die methoden-aufrufe über printf aus, damit ich sehen kann, was zurückgegeben wird 
  
printf "#{deque.get_daten()} \n"
printf "#{deque.push('k')} \n"
printf "#{deque.get_daten()} \n"
printf "hinten gelöscht: #{deque.pop()} \n"
printf "#{deque.get_daten()} \n"
printf "#{deque.enqueue('1')} \n"
printf "#{deque.get_daten()} \n"
printf "vorne gelöscht: #{deque.dequeue()} \n"
printf "#{deque.get_daten()} \n"
11.times do
  printf "hinten gelöscht: #{deque.pop()} \n"
end
printf "#{deque.get_daten()} \n"
printf "#{deque.push('1')} \n"
printf "#{deque.get_daten()} \n"
printf "#{deque.push('2')} \n"
printf "#{deque.get_daten()} \n"
printf "#{deque.push('3')} \n"
printf "#{deque.get_daten()} \n"
4.times do
  printf "vorne gelöscht: #{deque.dequeue()} \n"
end
counter = 0
7.times do
  counter += 1
  printf "#{deque.get_daten()} \n"
  printf "#{deque.enqueue(counter.to_s)} \n"
end
printf "#{deque.get_daten()} \n"

