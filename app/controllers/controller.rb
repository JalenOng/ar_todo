require_relative '../todo.rb'
# require_relative '../models/todo.rb'

def start(command)
  list
  command = ARGV
  task = command[0]
  task_desc = command[(1..-1)].join(" ")
  if task == "add"
    add_task(task_desc)
    start
  elsif task == "list"
    list
    start
  elsif task == "delete"
    delete_task(task_desc)
    start
  elsif task == "complete"
    completed(task_desc)
    start
  elsif task == "quit"

  else
    puts "Invalid command"
    start
  end
end

# list
# command = ARGV
# start(command)